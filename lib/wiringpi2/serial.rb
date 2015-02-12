module WiringPi2
  class Serial

    @id = 0
    @device = '/dev/ttyAMA0'
    @baud = 9600

    def initialize(device='/dev/ttyAMA0', baud=9600)

      @device = device
      @baud = baud

      @id = WiringPi2.serialOpen(@device, @baud)

    end

    def serial_close

      WiringPi2.serialClose(@id)
      @id = 0

    end

    def serial_put_char(char)

      WiringPi2.serialPutchar(@id, char)

    end

    def serial_puts(string)

      WiringPi2.serialPuts(@id, string)

    end

    def serial_data_avail

      WiringPi2.serialDataAvail(@id)

    end

    def serial_get_char

      WiringPi2.serialGetchar(@id)

    end

  end
end
