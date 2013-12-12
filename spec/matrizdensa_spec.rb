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
 
  describe "Enteros" do
    before :all do
      # Creando matrices 2x2
      # La variable @m3 será la matriz resultado. La inicializaremos en cada test.
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDensaFixnum.new(2, 2)
      @m3 = MatrizDensaFixnum.new(2, 2)

      # Inicializandolas
      @m1[0, 0] = 0
      @m1[0, 1] = 1
      @m1[1, 0] = 2
      @m1[1, 1] = 3

      @m2[0, 0] = 4
      @m2[0, 1] = 3
      @m2[1, 0] = 2
      @m2[1, 1] = 1
    end


  
    it "Suma" do
      @m3[0, 0] = 4
      @m3[0, 1] = 4
      @m3[1, 0] = 4
      @m3[1, 1] = 4

      (@m1+@m2).should eq(@m3)
    end

    it "Resta" do
      @m3[0, 0] = -4
      @m3[0, 1] = -2
      @m3[1, 0] = 0
      @m3[1, 1] = 2

      (@m1-@m2).should eq(@m3)
    end

    it "Multiplicación" do
      @m3[0, 0] = 0
      @m3[0, 1] = 3
      @m3[1, 0] = 4
      @m3[1, 1] = 3

      (@m1*@m2).should eq(@m3)
    end
 

    it "Comparación" do
      @m3[0, 0] = 0
      @m3[0, 1] = 1
      @m3[1, 0] = 2
      @m3[1, 1] = 3

      @m1.should eq(@m3)
    end
    it "Máximo" do
      (@m1.max).should eq(3)
    end
    it "Mínimo" do
      (@m1.min).should eq(0)
    end
    it "Tiene que cumplirse" do
      tmp = MatrizDensaFixnum.new(3, 3)
      tmp[0, 0] = 1
      tmp[0, 1] = 2
      tmp[0, 2] = 3
      tmp[1, 0] = 4
      tmp[1, 1] = 5
      tmp[1, 2] = 6
      tmp[2, 0] = 7
      tmp[2, 1] = 8
      tmp[2, 2] = 9
      
      (tmp.encontrar{|e| e*e >= 16}).should eq([1, 0])
    end
  end
#-----------------------------------------------------------------------
  
  
  describe "Fracciones" do
    before :all do
      # Creando matrices 2x2
      # La variable @m3 recordamos será el resultado
      @m1 = MatrizDensaFraccion.new(2, 2)
      @m2 = MatrizDensaFraccion.new(2, 2)
      @m3 = MatrizDensaFraccion.new(2, 2)

      @m1[0, 0] = Prct12::Fraccion.new(1, 1)
      @m1[0, 1] = Prct12::Fraccion.new(2, 2)
      @m1[1, 0] = Prct12::Fraccion.new(1, 2)
      @m1[1, 1] = Prct12::Fraccion.new(3, 2)

      @m2[0, 0] = Prct12::Fraccion.new(1, 3)
      @m2[0, 1] = Prct12::Fraccion.new(2, 1)
      @m2[1, 0] = Prct12::Fraccion.new(1, 1)
      @m2[1, 1] = Prct12::Fraccion.new(2, 3)
    end



    it "Suma" do
      @m3[0, 0] = Prct12::Fraccion.new(4, 3)
      @m3[0, 1] = Prct12::Fraccion.new(3, 1)
      @m3[1, 0] = Prct12::Fraccion.new(3, 2)
      @m3[1, 1] = Prct12::Fraccion.new(13, 6)

      (@m1+@m2).should eq(@m3)
    end

    it "Resta" do
      @m3[0, 0] = Prct12::Fraccion.new(2, 3)
      @m3[0, 1] = Prct12::Fraccion.new(-2, 2)
      @m3[1, 0] = Prct12::Fraccion.new(-1, 2)
      @m3[1, 1] = Prct12::Fraccion.new(5, 6)

      (@m1-@m2).should eq(@m3)
    end

    it "Multiplicación" do
      @m3[0, 0] = Prct12::Fraccion.new(1, 3)
      @m3[0, 1] = Prct12::Fraccion.new(2, 1)
      @m3[1, 0] = Prct12::Fraccion.new(1, 2)
      @m3[1, 1] = Prct12::Fraccion.new(1, 1)

      (@m1*@m2).should eq(@m3)
    end

    it "Comparación" do
      @m3[0, 0] = Prct12::Fraccion.new(1, 1)
      @m3[0, 1] = Prct12::Fraccion.new(2, 2)
      @m3[1, 0] = Prct12::Fraccion.new(1, 2)
      @m3[1, 1] = Prct12::Fraccion.new(3, 2)

      @m1.should eq(@m3)
    end
    it "Máximo" do
      (@m1.max).should eq(Prct12::Fraccion.new(3, 2))
    end
    it "Mínimo" do
      (@m1.min).should eq(Prct12::Fraccion.new(1, 2))
    end
  end

  #------------------------------------------------------------------------------------------
  describe "Tipos diferentes" do
    before :all do
      
      # Matrices 2x2
      #El resultado @m3 lo guardaremos en fraccion
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDensaFraccion.new(2, 2)
      @m3 = MatrizDensaFraccion.new(2, 2)


      @m1[0, 0] = 0
      @m1[0, 1] = 1
      @m1[1, 0] = 2
      @m1[1, 1] = 3

      @m2[0, 0] = Prct12::Fraccion.new(1, 2)
      @m2[0, 1] = Prct12::Fraccion.new(3, 2)
      @m2[1, 0] = Prct12::Fraccion.new(1, 3)
      @m2[1, 1] = Prct12::Fraccion.new(2, 2)
    end
  
    it "Suma" do
      @m3[0, 0] = Prct12::Fraccion.new(1, 2)
      @m3[0, 1] = Prct12::Fraccion.new(5, 2)
      @m3[1, 0] = Prct12::Fraccion.new(7, 3)
      @m3[1, 1] = Prct12::Fraccion.new(8, 2)

      (@m1+@m2).should eq(@m3)
    end

    it "Resta" do
      @m3[0, 0] = Prct12::Fraccion.new(-1, 2)
      @m3[0, 1] = Prct12::Fraccion.new(-1, 2)
      @m3[1, 0] = Prct12::Fraccion.new(5, 3)
      @m3[1, 1] = Prct12::Fraccion.new(2, 1)

      (@m1-@m2).should eq(@m3)
    end

    it "Multiplicación" do
      @m3[0, 0] = Prct12::Fraccion.new(0, 1)
      @m3[0, 1] = Prct12::Fraccion.new(3, 2)
      @m3[1, 0] = Prct12::Fraccion.new(2, 3)
      @m3[1, 1] = Prct12::Fraccion.new(3, 1)

      (@m1*@m2).should eq(@m3)
    end

    it "Comparación" do
      @m3[0, 0] = Prct12::Fraccion.new(0, 1)
      @m3[0, 1] = Prct12::Fraccion.new(2, 2)
      @m3[1, 0] = Prct12::Fraccion.new(4, 2)
      @m3[1, 1] = Prct12::Fraccion.new(3, 1)

      @m1.should eq(@m3)
    end
  end
end

