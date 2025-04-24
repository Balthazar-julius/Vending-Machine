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
    val io.coin2, io.coin5, idle = Value
  }
  
  import State._
  val stateReg = RegInit(idle)

  switch(stateReg){
    is (idle){
      when(io.coin2){
        stateReg := io.coin2
      }elsewhen(io.coin5)
    }
    is (io.coin2){
      when(io.coin2){
        stateReg :=
      }
    }
  }

  val newSum = Mux(validBuy, sumAddCoin, sumSubtractPrice)

  val sumGreaterThanPrice = newSum >= io.price
  
  io.releaseCan := io.buy & sumGreaterThanPrice
  io.alarm := io.buy ^ io.releaseCan
  
    
  io.seg := ~sevSeg
  io.an := "b1110".U
}




// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
}


