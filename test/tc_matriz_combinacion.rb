require "prct12"
require "test/unit"

#Devuelve un cero en matrices densas de enteros.
class MatrizDensaFixnum < Prct12::MatrizDensa
    #Devuelve un cero.
    def zero
        0
    end
end

#Devuelve un cero en matrices densas de fracciones.
class MatrizDensaFraccion < Prct12::MatrizDensa
    #Devuelve un cero.
    def zero
        Prct12::Fraccion.new(0, 1)
    end
end

#Devuelve un cero en matrices dispersas de enteros.
class MatrizDispersaFixnum < Prct12::MatrizDispersa
    #Devuelve un cero.
    def zero
        0
    end
end

#Devuelve un cero en matrices dispersas de fracciones.
class MatrizDispersaFraccion < Prct12::MatrizDispersa
    #Devuelve un cero.
    def zero
        Prct12::Fraccion.new(0, 1)
    end
end

#Diferentes operaciones con matrices dispersas y densas
class Test_Matriz_Combinacion < Test::Unit::TestCase

    #Crear e inicializar matrices.
    def setup
        # Matrices 2x2
        @m1 = MatrizDensaFixnum.new(2, 2)
        @m2 = MatrizDispersaFixnum.new(2, 2)
        @m3 = MatrizDensaFixnum.new(2, 2)

        # Inicializar
        @m1[0, 0] = 1
        @m1[0, 1] = 2
        @m1[1, 0] = 3
        @m1[1, 1] = 4

        @m2[0, 0] = 0
        @m2[0, 1] = 0
        @m2[1, 0] = 2
        @m2[1, 1] = 0
    end

    #Pruebas con enteros.
    def test_enteros
        #Suma
        @m3[0, 0] = 1
        @m3[0, 1] = 2
        @m3[1, 0] = 5
        @m3[1, 1] = 4
        assert_equal(@m3, @m1+@m2)

        #Resta
        @m3[0, 0] = 1
        @m3[0, 1] = 2
        @m3[1, 0] = 1
        @m3[1, 1] = 4
        assert_equal(@m3, @m1-@m2)

        #Multiplicación
        @m3[0, 0] = 0
        @m3[0, 1] = 0
        @m3[1, 0] = 6
        @m3[1, 1] = 0
        assert_equal(@m3, @m1*@m2)

        #Comparación
        @m3[0, 0] = 0
        @m3[0, 1] = 0
        @m3[1, 0] = 2
        @m3[1, 1] = 0
        assert_equal(@m3, @m2)
    end
end