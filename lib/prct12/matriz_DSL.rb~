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

    # Enviar a un fichero si se indica
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

  