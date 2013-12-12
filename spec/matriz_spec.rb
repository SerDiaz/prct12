require "prct12"

describe Prct12::Matriz do
  before :all do
    class MatrizDensaFixnum < Prct12::MatrizDensa
      #Devuelve un cero.
      def zero
        0
      end
    end

    class MatrizDensaFraccion < Prct12::MatrizDensa
      #Devuelve un cero.
      def zero
        Prct12::Fraccion.new(0, 1)
      end
    end

    class MatrizDispersaFixnum < Prct12::MatrizDispersa
      #Devuelve un cero.
      def zero
        0
      end
    end

    class MatrizDispersaFraccion < Prct12::MatrizDispersa
      #Devuelve un cero.
      def zero
        Prct12::Fraccion.new(0, 1)
      end
    end
  end
