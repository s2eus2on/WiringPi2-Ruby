module WiringPi2
  class I2C
	@device_id = 0
	def initialize(device_address)
	  @device_id = WiringPi2.wiringPiI2CSetup(device_address)
	end
	def read()
	  return WiringPi2.wiringPiI2CRead(@device_id)
	end
	def write(data)
	  return WiringPi2.wiringPiI2CWrite(@device_id,data)
	end
	def read_reg_8(reg)
	  return WiringPi2.wiringPiI2CReadReg8(@device_id,reg)
	end
	def write_reg_8(reg,data)
	  return WiringPi2.wiringPiI2CWriteReg8(@device_id,reg,data)
	end
	def read_reg_16(reg)
	  return WiringPi2.wiringPiI2CReadReg16(@device_id,reg)
	end
	def write_reg_16(reg,data)
	  return WiringPi2.wiringPiI2CWriteReg16(@device_id,reg,data)
	end
  end
end
