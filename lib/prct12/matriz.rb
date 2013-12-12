module Prct12

#Clase matrices
class Matriz
  include Enumerable

  attr_reader :filas, :columnas

  #Constructor. Solo asigna
  def initialize(filas, columnas)
    validate_sizes(filas, columnas)
    @filas = filas
    @columnas = columnas
  end

  #Recorrer todos elementos matriz
  def each
    filas.times do |i|
      columnas.times do |j|
        yield self[i,j]
      end
    end
  end
  
  
  ######ARITMETICA######

  #Suma 
  def +(other)
    if((filas == other.filas) && (columnas == other.columnas))
      sum = self.class.new(filas, columnas)
      filas.times do |i|
        columnas.times do |j|
          sum[i, j] = self[i, j] + other[i, j]
        end
      end
      sum
    else
      puts "Error, matrices con tamanyos distintos"
    end
  end

  #Resta 
  def -(other)
    if((filas == other.filas) && (columnas == other.columnas))
      res = self.class.new(filas, columnas)
      filas.times do |i|
        columnas.times do |j|
          res[i, j] = self[i, j] - other[i, j]
        end
      end
      res
    else
      puts "Error, matrices con tamanyos distintos"
    end
  end

  
  #####MULTIPICACION#####
  
  #Comprobacion posible multiplicación
  def *(other)
    # coumnas primera matriz coincidad filas de la segunda matriz
    if columnas != other.filas
      raise(ArgumentError, "Error, matrices no validas para multiplicar")
      return
    end

    #Matriz resultante de una multiplicacion
    result = self.class.new(filas, other.columnas)

    #Multiplicacion
    0.upto(result.filas-1) do |i|
      0.upto(result.columnas-1) do |j|
        0.upto(columnas-1) do |k|
          result[i, j] = result[i, j] + (self[i, k] * other[k, j])
        end
      end
    end
    result
  end

  #Comparación
  def ==(other)
    if(filas != other.filas || columnas != other.columnas)
      return false
    end

    filas.times do |i|
      columnas.times do |j|
        if(self[i, j] != other[i, j])
          return false
        end
      end
    end

    true
  end

  #Maximo elemento
  def max
    maximo = self[0, 0]
    self.each do |x|
      if x > maximo
        maximo = x
      end
    end
    maximo
  end

  #Elemento minimo
  def min
    minimo = self[0,0]
    self.each do |x|
      if x < minimo
        minimo = x
      end
    end
    minimo
  end

  #Conversion string
  def to_s
    s = ""
    filas.times do |i|
      columnas.times do |j|
        s << " #{self[i, j]}"
      end
      s << "\n"
    end
    s
  end
  
  #Find elemento, devuelve pos
  def encontrar
    filas.times do |i|
      columnas.times do |j|
        if(yield(self[i, j]))
          return i, j
        end
      end
    end
    nil
  end

 protected
  #modificacion numero de filas
  def filas=(value)
    @filas = value
  end

  #modificacion de numero columnas
  def columnas=(value)
    @columnas = value
  end

  #Valores pasados dentro del rango
  def validate_sizes(*values)
    values.each do |x|
      raise(ArgumentError, "#{x} valor invalido") unless(x.is_a?Integer and x >= 0)
    end
  end

end #class

end #module