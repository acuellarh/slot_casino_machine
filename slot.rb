=begin
 1. Bienvenidad y explicación con la descripción de los 10 caracteres
 2. Iniciar el juego 
 3. Evaluar en cada  linea si hay coincidencias 3 o más desde el principio en alguna línea
      Si hay conincidencias 3 o más desde el inicio
        identificar cuantos caracteres coincidieron
        identificar el indice de la línea con coincidencia        
        ir al punto 4
      Si o hay coincidencias
        Ir al punto 4
 4. Mostrar los resultados
      Mostrar el board aleatorio
      si hubo conincidencias 
        Mostrar el arreglo con las lineas donde hubo coincidencia y la cantidad de concidencias en cada una (3 ó más)
        Mostrar la cantidad de la apuesta
        Mostrar la cantidad ganada       
      Si no hubo coincidencias  
        Mostrar el arreglo coincidencias vacio
        Mostrar la cantidad de la apuesta
        Mostrar la cantidad ganada en cero
  5. Volver al punto 1 (nuevo juego)
=end

=begin
 1. Como representar los 10 digitos iniciales
 2. Como representar el board aleatorio
 3. Como representar las tres filas de
=end

class Board
  attr_reader :simbol_list

  def initialize(simbol_list)
    @simbol_list_random = []
    @simbol_list = simbol_list
    random_generator
  end
 
  def take!
    @question_list.shift.strip.upcase # sacar el primer elemento de un array y el método strip para limpiar "\n"
  end
  
  private
  def random_generator
    15.times do |i|
      value = @simbol_list.shuffle.first
      @simbol_list_random = @simbol_list_random.push(value) 
    end
    # CODE FOR TEST
    #  array_for_test = [["J"],["J"],["J"], ["Q"],["K"],["Cat"],["J"],["Q"],["Monkey"],["Bird"],["Bird"],["Bird"],["J"],["Q"],["A"]]
    #  @simbol_list_random = array_for_test.each_slice(5).to_a
    # END OF CODE FOR TEST
    #print  @simbol_list_random 
    @simbol_list_random = @simbol_list_random.each_slice(5).to_a
    print  @simbol_list_random 
  end

end

simbol_list = [["10"],["J"],["Q"], ["A"],["K"],["Cat"],["Dog"],["Monkey"],["Bird"]]
board_array = Board.new(simbol_list)


