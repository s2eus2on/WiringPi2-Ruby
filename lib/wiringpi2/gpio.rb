module WiringPi2
  class GPIO

    @modules = Array.new
    @pins = Array.new

    attr_reader :modules, :pins

    def initialize(&block)
      WiringPi2.wiringPiSetup
      @pins = Array.new
      instance_eval &block
    end

    def read_byte(starting_pin)
      bits = Array.new
      8.times do |time|
        bits << WiringPi2.digitalRead(starting_pin + time)
      end
      bits.join
    end

    def write_byte(starting_pin, byte)
      byte = byte.to_s(2) unless byte.length = 8
      offset = starting_pin
      byte.each_char do |bit|
        WiringPi2.digitalWrite(offset, bit)
        offset += 1
      end
    end

    def digital_read(pin)
      if pin.respond_to?(:each)
        pin.collect do |pin|
          WiringPi2.digitalRead(pin)
        end
      else
        WiringPi2.digitalRead(pin)
      end
    end

    def digital_write(pin, value)
      if pin.respond_to?(:each)
        pin.each do |pin|
          WiringPi2.digitalWrite(pin, value)
        end
      else
        WiringPi2.digitalWrite(pin, value)
      end
    end

    def pin_mode(pin, mode)
      WiringPi2.pinMode(pin, mode)
    end

  def delay(ms)
    WiringPi2.delay(ms)
  end

  def delay_microseconds(ms)
    WiringPi2.delayMicroseconds(ms)
  end

  def millis()
    return WiringPi2.millis()
  end

  def micros()
    return WiringPi2.micros()
  end

  def pwm_set_mode(mode)
    return WiringPi2.pwmSetMode(mode)
  end

  def pwm_set_range(range)
    return WiringPi2.pwmSetRange(range)
  end

  def pwm_set_clock(divisor)
    return WiringPi2.pwmSetClock(divisor)
  end

  def gpio_clock_set(pin, freq)
    return WiringPi2.gpioClockSet(pin, freq)
  end

  def wait_for_interrupt(pin, ms)
    WiringPi2.waitForInterrupt(pin, ms)
  end

  def wiringpi_isr(pin, mode, fn)
    WiringPi2.wiringPiISR(pin, mode, fn)
  end

  def shift_out(dpin, cpin, order, val )
    WiringPi2.shiftOut(dpin,cpin,order,val)
  end

  def shift_in(dpin, cpin, order)
    WiringPi2.shiftIn(dpin,cpin,order)
  end

    def add_module(module_instance)
      @modules = Array.new if @modules.nil?

      @modules << module_instance
      puts 'Added module ' + module_instance.name.to_s

      module_instance.pin_count.times do |offset|
        @pins[offset + module_instance.pin_base] = 'ENABLED'
      end
    end
  end
end
