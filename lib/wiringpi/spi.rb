module WiringPi2
  class SPI
    @channel = 0
	def initialize(channel,speed)
	  @channel = channel
    WiringPi2.wiringPiSPISetup(channel,speed)
	end
	def wiringPiSPIGetFd()
	  return WiringPi2.wiringPiSPIGetFd(@channel)
	end
	def wiringPiSPIDataRW(data)
	  return WiringPi2.wiringPiSPIDataRW(@channel,data)
	end
  end
end
