require "prct12/matriz"

module Prct12

# Módulo agrupacion de operaciones aritmeticas
module TipoOperacion
  # Suma matrices
  SUMA = :suma

  # Resta matrices
  RESTA = :resta

  # Multiplicacion matrices
  MULTIPLICACION = :multiplicacion

  # no operaciones
  NINGUNA = :ninguna
end

# Módulo agrupacion operaciones resultado
module TipoSalida
  # Pantalla
  CONSOLA = :consola

  # Fichero
  FICHERO = :fichero

  # No se muestra
  NINGUNA = :ninguna
end

# Clase DSL paara manipulacion de matrices
class MatrizDSL

  # El constructor permitirá definir el tipo de matriz a crear y caracteristicas.
  #Ejemplo:
  #
  # class MatrizDensaFixnum < Prct12::MatrizDensa
  # def zero
  # 0
  # end
  # end
  #
  # matriz = Prct12::MatrizDSL(MatrizDensaFixnum) do
  # operacion Prct12::TipoOperacion::RESTA
  # salida Prct12::TipoSalida::FICHERO, "out.txt"
  # operando [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  # operando [[9, 8, 7], [6, 5, 4], [3, 2, 1]]
  # end
  def initialize(tipo_matriz, &bloque)
    if !(tipo_matriz.is_a? Class)
      raise ArgumentError, "Se esperaba una clase"
    end

    @tipo = tipo_matriz # ¿Tipo de matriz? densa o dispersa
    @op = TipoOperacion::NINGUNA # Operacion aritmetica
    @out = [] # Modo de salida
    @file = "" # Fichero salida
    @mats = [] # Array de matrices

    # REcuperar nformacion que pasa el usuario mediante DSL
    instance_eval(&bloque)

    # Mostrar si se indica la salida por pantalla
    if @out.include? TipoSalida::CONSOLA
      @mats.each_with_index do |x, i|
        puts "-- MATRIZ #{i+1} --"
        puts x.to_s
        print "\n"
      end

      puts "-- RESULTADO --"
      puts calcular.to_s
      print "\n"
    end

    # Guardar en un fichero
    if @out.include? TipoSalida::FICHERO
      File.open(@file, 'w') do |f|
        @mats.each_with_index do |x, i|
          f.puts "-- MATRIZ #{i+1} --"
          f.puts x.to_s
          f.print "\n"
        end

        f.puts "-- RESULTADO --"
        f.puts calcular.to_s
        f.print "\n"
      end
    end
  end

  
  # Indicar operacion. Prevalecera la ultima.
  def operacion(op)

    # Si concuerda lo pasado con el array de constantes asignamos.
    
    TipoOperacion.constants.each do |x|
      if(TipoOperacion.const_get(x) == op)
        @op = op
        return
      end
    end

    # Valor no valido
    raise ArgumentError, "Operacion no valida, no se encuentra en el array de constantes"
  end

  #Salida de metodos, en el caso de CONSOLA o NINGUNA no se guardara el valor.
  #En el caso de NINGUNA invalidara el resto de opciones.

  def salida(tipo_out, fichero_salida = "")

    
    if (@out.size == 1) && (@out[0] == TipoSalida::NINGUNA)
      return
    end

    
    TipoSalida.constants.each do |x|
      if(TipoSalida.const_get(x) == tipo_out)

        
        if tipo_out != TipoSalida::NINGUNA
          @out.push tipo_out
          @out.uniq!

          # se guardara
          if tipo_out == TipoSalida::FICHERO
            @file = fichero_salida
          end

        # Caso NINGUNA.
        else
          @out.clear
          @out.push tipo_out
        end
        return
      end
    end

    # error
    raise ArgumentError, "Tipo_out no valido"
  end

  #Se recibe array de arrays y se desea operar como una matriz 
  def operando(def_matriz)
    if (def_matriz.is_a? Array) && (def_matriz[0].is_a? Array)
      @mats.push crear_matriz(def_matriz)
    else
      raise ArgumentError, "Error, tipo introducido no valido."
    end
  end

  
  def to_matriz_array
    @mats
  end

  
  def to_m
    calcular
  end

protected

  # Creacionn de matriz a partir de array de arrays
  def crear_matriz(mat)
    m = @tipo.new(mat.size, mat[0].size)
    mat.each_with_index do |x, i|
      x.each_with_index do |y, j|
        m[i, j] = y
      end
    end
    m
  end

  # Calcula el resultado de los operandos introducidos y los devuelve como objetos de clase.

  def calcular
    if (@op != TipoOperacion::NINGUNA) && (@mats.size > 1)
      case @op
      when TipoOperacion::SUMA
        return @mats.reduce(:+)
      when TipoOperacion::RESTA
        return @mats.reduce(:-)
      when TipoOperacion::MULTIPLICACION
        return @mats.reduce(:*)
      end
    else
      raise RuntimeError, "Faltan datos. "
    end
  end

end #class 

end 
  