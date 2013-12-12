require "prct12"
require "test/unit"

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

#Clase para probar operaciones entre matrices densas.
class Test_Matriz_Densa < Test::Unit::TestCase
    
    #Crear e inicializar matrices.
    def setup
        # Matrices 2x2
        @m1 = MatrizDensaFixnum.new(2, 2)
        @m2 = MatrizDensaFixnum.new(2, 2)
        @m3 = MatrizDensaFixnum.new(2, 2)
        @m4 = MatrizDensaFraccion.new(2, 2)
        @m5 = MatrizDensaFraccion.new(2, 2)
        @m6 = MatrizDensaFraccion.new(2, 2)

       #Enteros, inicializar
        @m1[0, 0] = 0
        @m1[0, 1] = 1
        @m1[1, 0] = 2
        @m1[1, 1] = 3

        @m2[0, 0] = 4
        @m2[0, 1] = 3
        @m2[1, 0] = 2
        @m2[1, 1] = 1

        #Fracciones, inicializar
        @m4[0, 0] = Prct12::Fraccion.new(1, 2)
        @m4[0, 1] = Prct12::Fraccion.new(2, 2)
        @m4[1, 0] = Prct12::Fraccion.new(3, 2)
        @m4[1, 1] = Prct12::Fraccion.new(1, 3)
      
        @m5[0, 0] = Prct12::Fraccion.new(5, 2)
        @m5[0, 1] = Prct12::Fraccion.new(3, 2)
        @m5[1, 0] = Prct12::Fraccion.new(0, 1)
        @m5[1, 1] = Prct12::Fraccion.new(0, 1)
    end

    
    #---------------------------------------------------------------
    #Enteros
    def test_enteros
        #Suma
        @m3[0, 0] = 4
        @m3[0, 1] = 4
        @m3[1, 0] = 4
        @m3[1, 1] = 4
        assert_equal(@m3, @m1+@m2)

        #Resta
        @m3[0, 0] = -4
        @m3[0, 1] = -2
        @m3[1, 0] = 0
        @m3[1, 1] = 2
        assert_equal(@m3, @m1-@m2)

        #Multiplicación
        @m3[0, 0] = 0
        @m3[0, 1] = 3
        @m3[1, 0] = 2
        @m3[1, 1] = 3
        assert_equal(@m3, @m1*@m2)

        #Comparación
        @m3[0, 0] = 0
        @m3[0, 1] = 1
        @m3[1, 0] = 2
        @m3[1, 1] = 3
        assert_equal(@m3, @m1)

        #Mínimo
        assert_equal(@m1.min,0)

        #Máximo
        assert_equal(@m1.max,3)

    end

    
    #---------------------------------------------------------
    #Fracciones
    def test_fracciones
      
      #Suma
      @m6[0, 0] = Prct12::Fraccion.new(3, 1)
      @m6[0, 1] = Prct12::Fraccion.new(5, 2)
      @m6[1, 0] = Prct12::Fraccion.new(3, 2)
      @m6[1, 1] = Prct12::Fraccion.new(1, 3)
        assert_equal(@m6, @m4+@m5)

        #Resta
      @m6[0, 0] = Prct12::Fraccion.new(-2, 1)
      @m6[0, 1] = Prct12::Fraccion.new(-1, 2)
      @m6[1, 0] = Prct12::Fraccion.new(3, 2)
      @m6[1, 1] = Prct12::Fraccion.new(-1, 3)
        assert_equal(@m6, @m4-@m5)

        #Multiplicación
      @m3[0, 0] = Prct12::Fraccion.new(5, 4)
      @m3[0, 1] = Prct12::Fraccion.new(3, 2)
      @m3[1, 0] = Prct12::Fraccion.new(0, 1)
      @m3[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m4*@m5)

        #Comparación
        @m6[0, 0] = Prct12::Fraccion.new(1, 2)
        @m6[0, 1] = Prct12::Fraccion.new(2, 2)
        @m6[1, 0] = Prct12::Fraccion.new(3, 2)
        @m6[1, 1] = Prct12::Fraccion.new(1, 3)
        assert_equal(@m6, @m4)

        #Mínimo
        assert_equal(@m4.min,Prct12::Fraccion.new(1, 3))

        #Máximo
        assert_equal(@m4.max,Prct12::Fraccion.new(3, 2))
    end

    
    

