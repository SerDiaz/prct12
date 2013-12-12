require "prct12"

describe Prct12::MatrizDensa do
  before :all do

    class MatrizDensaFixnum < Prct12::MatrizDensa
      def zero
        0
      end
    end

    class MatrizDensaFraccion < Prct12::MatrizDensa
      def zero
        Prct12::Fraccion.new(0, 1)
      end
    end

  end
 