module WiringPi
  class SPI
    @channel = 0
	def initialize(channel,speed)
	  @channel = channel
	  Wiringpi2.wiringPiSPISetup(channel,speed)
	end
	def wiringPiSPIGetFd()
	  return Wiringpi2.wiringPiSPIGetFd(@channel)
	end
	def wiringPiSPIDataRW(data)
	  return Wiringpi2.wiringPiSPIDataRW(@channel,data)
	end
  end
end
