require "prct12"

describe Prct12::MatrizDispersa do
  before :all do
    class MatrizDispersaFixnum < Prct12::MatrizDispersa
      def zero
        0
      end
    end

    class MatrizDispersaFraccion < Prct12::MatrizDispersa
      def zero
        Prct12::Fraccion.new(0, 1)
      end
    end

    # Matrices 2x2. En este casi creamos 6
    @m1 = MatrizDispersaFixnum.new(2, 2)
    @m2 = MatrizDispersaFixnum.new(2, 2)
    @m3 = MatrizDispersaFixnum.new(2, 2)
    @m4 = MatrizDispersaFraccion.new(2, 2)
    @m5 = MatrizDispersaFraccion.new(2, 2)
    @m6 = MatrizDispersaFraccion.new(2, 2)
    
  end

  describe "Enteros" do
    before :all do
      #Inicializar
      @m1[0, 0] = 1
      @m1[0, 1] = 0
      @m1[1, 0] = 0
      @m1[1, 1] = 0

      @m2[0, 0] = 2
      @m2[0, 1] = 0
      @m2[1, 0] = 0
      @m2[1, 1] = 0
    end

    it "Suma" do
      @m3[0, 0] = 3
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0

      (@m1+@m2).should eq(@m3)
    end
    it "Resta" do
      @m3[0, 0] = -2
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0
      
      (@m1-@m2).should eq(@m3)
    end
    it "Multiplicación" do
      @m3[0, 0] = 2
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0
      
      (@m1*@m2).should eq(@m3)
    end
    it "Comparación" do
      @m3[0, 0] = 2
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0
      
      @m1.should eq(@m3)
    end
    it "Máximo" do
      (@m1.max).should eq(1)
    end
    it "Mínimo" do
      (@m1.min).should eq(0)
    end
  end

  #--------------------------------------------------------------------------
  describe "Fracciones" do
    before :all do
      #Inicializar
      @m4[0, 0] = Prct12::Fraccion.new(0, 1)
      @m4[0, 1] = Prct12::Fraccion.new(0, 1)
      @m4[1, 0] = Prct12::Fraccion.new(3, 2)
      @m4[1, 1] = Prct12::Fraccion.new(0, 1)

      @m5[0, 0] = Prct12::Fraccion.new(0, 1)
      @m5[0, 1] = Prct12::Fraccion.new(0, 1)
      @m5[1, 0] = Prct12::Fraccion.new(5, 2)
      @m5[1, 1] = Prct12::Fraccion.new(0, 1)
    end
    
    it "Suma" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(4, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      (@m4+@m5).should eq(@m6)
    end
    it "Resta" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(-1, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      (@m4-@m5).should eq(@m6)
    end
    it "Multiplicación" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(15, 2)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      (@m4*@m5).should eq(@m6)
    end
    it "Comparación" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(3, 2)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      @m4.should eq(@m6)
    end
    it "Máximo" do
      (@m4.max).should eq(Prct12::Fraccion.new(3, 2))
    end
    it "Mínimo" do
      (@m4.min).should eq(Prct12::Fraccion.new(0, 1))
    end
  end

 #-----------------------------------------------------------------------------------------------------
  describe "Tipos diferentes" do
    before :all do
      # Crear matrices de fracciones y enteros
      @m1[0, 0] = 0
      @m1[0, 1] = 0
      @m1[1, 0] = 0
      @m1[1, 1] = 4

      @m4[0, 0] = Prct12::Fraccion.new(0, 1)
      @m4[0, 1] = Prct12::Fraccion.new(0, 1)
      @m4[1, 0] = Prct12::Fraccion.new(0, 1)
      @m4[1, 1] = Prct12::Fraccion.new(3, 2)
    end

    it "Suma" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(11, 2)

      (@m1+@m4).should eq(@m6)
    end
    it "Resta" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(5, 2)

      (@m1-@m4).should eq(@m6)
    end
    it "Multiplicación" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(12, 1)

      (@m1*@m4).should eq(@m6)
    end
    it "Comparación" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(4, 1)

      @m1.should eq(@m6)
    end

  end
end