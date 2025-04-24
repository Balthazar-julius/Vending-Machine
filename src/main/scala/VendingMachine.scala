import chisel3._
import chisel3.util._

class VendingMachine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireDefault(0.U)

  // ***** some dummy connections *****
  sevSeg := "b1111111".U
  
  io.alarm := 0.B
  io.releaseCan := 0.B
  
  
  object State extends ChiselEnum {
    val idle, s_coin2, s_coin2_rep, s_coin5, s_coin5_rep, s_buy, s_buy_rep = Value
  }

  import State._
  val stateReg = RegInit(idle)
  val boughtReg = RegInit(false.B)

  switch(stateReg) { // Button state machine
    is(idle) {
      when(io.coin2) {
        stateReg := s_coin2
      }.elsewhen(io.coin5) {
        stateReg := s_coin5
      }.elsewhen(io.buy) {
        stateReg := s_buy
      }
    }

    is(s_coin2) {
      when(io.coin2) {
        stateReg := s_coin2_rep
      }.elsewhen(!io.coin2) {
        stateReg := idle
      }
    }

    is(s_coin2_rep) {
      when(!io.coin2) {
        stateReg := idle
      }
    }

    is(s_coin5) {
      when(io.coin5) {
        stateReg := s_coin5_rep
      }.elsewhen(!io.coin5) {
        stateReg := idle
      }
    }

    is(s_coin5_rep) {
      when(!io.coin5) {
        stateReg := idle
      }
    }

    is(s_buy) {
      when(io.buy) {
        stateReg := s_buy_rep
      }
    }
  
    is(s_buy_rep) {
      when(!io.buy) {
        boughtReg := false.B
        stateReg := idle
      }
    }
  }

  val coinValue = WireDefault(0.U(4.W)) //Mux der vælger hvilken knap vi trykker på
  switch(stateReg) {
    is(s_coin2) {coinValue := 2.U}
    is(s_coin2_rep) {coinValue := 0.U}
    is(s_coin5) {coinValue := 5.U}
    is(s_coin5_rep) {coinValue := 0.U}
  }

  val sumReg = RegInit(0.U(6.W)) //Registrer vores newSum
  sumReg := Mux(io.releaseCan && (stateReg === s_buy), sumReg - io.price, sumReg + coinValue) //mux der vælger om vi skal trække fra eller lægge til

  when(io.releaseCan && (stateReg === s_buy)) {
    boughtReg := true.B
  }

  val sumGreaterThanPrice = sumReg >= io.price // Sammenligner summen og prisen

  io.releaseCan := io.buy & (sumGreaterThanPrice || boughtReg) // LED til succesfuldt køb
  io.alarm := ~boughtReg & (io.buy ^ io.releaseCan) // LED til ikke-succesfuldt køb

  val secondPriceDigit = io.price / 10.U
  val firstPriceDigit = io.price - (secondPriceDigit * 10.U)
  
  val secondSumDigit = sumReg / 10.U
  val firstSumDigit = sumReg - (secondSumDigit * 10.U)

  val cntReg = RegInit (0.U(50.W))
  val segReg = RegInit (0.U(8.W))
  cntReg := cntReg + 1.U
  when(cntReg === (100000-1).U) { // Tæl til 100000
    cntReg := 0.U
    when(segReg === 3.U) {
      segReg := 0.U
    } .otherwise {
      segReg := segReg + 1.U
    }
  }
  
  val m = Wire(Vec(4, UInt (8.W))) // Mux til at lave display
  val muxOut1 = RegInit (0.U(4.W)) // Output af display-mux

  when (io.alarm) {
    m(0) := 10.U // F
    m(1) := 11.U // E
    m(2) := 12.U // J
    m(3) := 13.U // L
    muxOut1 := m(segReg)
  } .otherwise {
    m(0) := secondSumDigit // Anden ciffer til sum
    m(1) := firstSumDigit // Første ciffer til sum
    m(2) := secondPriceDigit // Anden ciffer til pris
    m(3) := firstPriceDigit // Første ciffer til pris
    muxOut1 := m(segReg)
  }

  val g = Wire(Vec(4, UInt (8.W))) // Mux til at vælge segment
  g(0) := "b1000".U
  g(1) := "b0100".U
  g(2) := "b0010".U
  g(3) := "b0001".U
  io.an := ~g(segReg)
  
  switch(muxOut1) { // LUT til seven segment display
    is ("b0000".U) { sevSeg := "b0111111".U} // 0
    is ("b0001".U) { sevSeg := "b0000110".U} // 1
    is ("b0010".U) { sevSeg := "b1011011".U} // 2
    is ("b0011".U) { sevSeg := "b1001111".U} // 3
    is ("b0100".U) { sevSeg := "b1100110".U} // 4
    is ("b0101".U) { sevSeg := "b1101101".U} // 5
    is ("b0110".U) { sevSeg := "b1111101".U} // 6
    is ("b0111".U) { sevSeg := "b0000111".U} // 7
    is ("b1000".U) { sevSeg := "b1111111".U} // 8
    is ("b1001".U) { sevSeg := "b1100111".U} // 9

    is ("b1010".U) { sevSeg := "b1110001".U} // F
    is ("b1011".U) { sevSeg := "b1111001".U} // E
    is ("b1100".U) { sevSeg := "b0011111".U} // J
    is ("b1101".U) { sevSeg := "b0111000".U} // L
  }

  io.seg := ~sevSeg
}

// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
}