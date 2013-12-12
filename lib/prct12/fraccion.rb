module Prct12

#Clase fraccion
class Fraccion
    include Comparable
    #num = numerador denom = denominador
    attr_reader :num, :denom

    #initialize
    def initialize(n,d)
        raise 'el Denominador no puede ser 0' unless d != 0
        @num, @denom = n, d

        if n == 0
            @denom = 1
        else
            reducir
        end
    end

    #transformar en string 
    def to_s
        "#{num}/#{denom}"
    end

    #Resultado en Float
    def to_f
        # to_f 
        (@num.to_f/@denom.to_f)
    end

    #Comparacion de funciones
    def <=>(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        (d/@denom)*@num <=> (d/other.denom)*other.num
    end

    #Suma Fracciones
    def +(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num + (d/other.denom)*other.num, d)
    end

    #Resta fracciones.
    def -(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num - (d/other.denom)*other.num, d)
    end

    #Multiplicacion fracciones
    def *(other)
        if !(other.is_a? Fraccion)
            Fraccion.new(@num*other, @denom)
        else
            Fraccion.new(@num*other.num, @denom*other.denom)
        end
    end

    #Dividir funciones.
    def /(other)
        if !(other.is_a? Fraccion)
            Fraccion.new(@num, @denom*other)
        else
            Fraccion.new(@num*other.denom, @denom*other.num)
        end
    end

    #Modulo
    #0/1
    def %(other)
        Fraccion.new(0, 1)
    end

    #Fraccion cambiada de signo
    def -@
        Fraccion.new(-@num, @denom)
    end
    
    #Coerce para operar tb con enteros
    def coerce(other)
        [Fraccion.new(other, 1), self]
    end

    #abs, valor absoluto
    def abs
        # En initialize se logra que si es negativo aparezca en el numerador
	# Por lo que solo es necesario hacer el abs sobre el numerador
        Fraccion.new(@num.abs, @denom)
    end

    #Inversa
    def rec
       
        Fraccion.new(@denom, @num)
    end

private

    def reducir
        # Si alguno es negativo que sea el numerador. 
        if @denom < 0
            @num = -@num
            @denom = -@denom
        end

	#Reducir fracciones dividiendo entre mcd
        mcd = gcd(@num, @denom)
        if mcd != 0
            @num /= mcd
            @denom /= mcd
        end
    end

    #Calculo de mcd
    def gcd(a, b)
        a,b = a.abs, b.abs
        while b != 0
            a, b = b, a % b
        end
        a
    end

end #class

end #module