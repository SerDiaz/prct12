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

  describe "Enteros" do
    before :all do
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDispersaFixnum.new(2, 2)
      @m3 = MatrizDensaFixnum.new(2, 2)

      @m1[0, 0] = 0
      @m1[0, 1] = 1
      @m1[1, 0] = 2
      @m1[1, 1] = 3

      @m2[0, 0] = 0
      @m2[0, 1] = 1
      @m2[1, 0] = 0
      @m2[1, 1] = 1
    end

    it "Suma" do
      @m3[0, 0] = 0
      @m3[0, 1] = 2
      @m3[1, 0] = 2
      @m3[1, 1] = 4

      (@m1+@m2).should eq(@m3)
    end

    it "Resta" do
      @m3[0, 0] = 0
      @m3[0, 1] = 0
      @m3[1, 0] = -2
      @m3[1, 1] = 2

      (@m1-@m2).should eq(@m3)
    end

    it "Multiplicación" do
      @m3[0, 0] = 0
      @m3[0, 1] = 1
      @m3[1, 0] = 0
      @m3[1, 1] = 3

      (@m1*@m2).should eq(@m3)
    end

    it "Comparación" do
      @m3[0, 0] = 0
      @m3[0, 1] = 1
      @m3[1, 0] = 0
      @m3[1, 1] = 1

      @m2.should eq(@m3)
    end

  end
