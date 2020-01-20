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
 3. Como representar las tres filas del juego aleatorias
 4. Como identificar los match en cada arreglo
 5. Como representar el payline con la cantidad de matchs
 6. Como representar la apuesta y la suma de la misma
=end

class Board
  attr_reader :simbol_list

  def initialize(simbol_list)
    @simbol_list = simbol_list
    @simbol_list_random = []
    @simbol_list_random_array = []
    #random_generator
  end  
  
  def random_generator
    15.times do |i|
      value = @simbol_list.shuffle.first
      @simbol_list_random = @simbol_list_random.push(value) 
    end
    # CODE FOR TEST
    #  array_for_test = [["J"],["J"],["J"], ["Q"],["K"],["Cat"],["J"],["Q"],["Monkey"],["Bird"],["Bird"],["Bird"],["J"],["Q"],["A"]]
    #  array_for_test = [["J"],["J"],["J"], ["Q"],["K"],["Cat"],["J"],["Q"],["Monkey"],["Bird"],["Bird"],["Bird"],["J"],["Q"],["A"]]
    #  array_for_test = [["J"],["J"],["J"], ["Q"],["K"],["Cat"],["Cat"],["Cat"],["Cat"],["Bird"],["Bird"],["Bird"],["A"],["Bird"],["Bird"]]
    #  @simbol_list_random_array = array_for_test.each_slice(5).to_a
    # END OF CODE FOR TEST
    
    print  @simbol_list_random 
    puts
    @simbol_list_random_array = @simbol_list_random.each_slice(5).to_a


  end

  # def print_board
  #   print @simbol_list_random
  #   puts  
  # end

end

class ReadLine   

  def initialize (board_array, array_paylines)
    @board_array = board_array
    @array_paylines = array_paylines
    @index_and_countmatch = []
    @pay_out = 0
  end
  
  def hit!
  #  puts "inicio"
  #  print @board_array.random_generator
   puts 

   @board_array.random_generator.each_with_index do |a,index|
     count = 0
     new_a = []
     a.each_with_index do |i, index2|
         if index2 == 0
             new_a.push(i)
         elsif new_a[index2 -1] == i
             new_a.push(i)
         else
             new_a = new_a
         end
     end

      print  "Matching with index:  #{index} and  #{new_a.length} times "
      puts
     if new_a.length > 1
      #print  "Matching with index:  #{index} and  #{new_a.length} times "
      #puts
      # @index_and_countmatch.push(Hash[index => new_a.length])
       @index_and_countmatch.push(Hash[@array_paylines[index] => new_a.length])
     end     
   end

   if @index_and_countmatch.length != 0  
    print @index_and_countmatch
    puts
    bet_compute
   else
    print "No ganaste"  
   end
    
  end

  def bet_compute
    gain = 0
    bet = 100
    @index_and_countmatch.each do |key, value| 
      if value == 3
        gain = gain + bet*0.2
      elsif value == 4
        gain = gain + bet*2   
      else
        gain = gain + bet*10
      end
    end
    print "bet_amount: #{bet}"
    print "total_win:  #{gain}"
  end
  
  
end

simbol_list = [["10"],["J"],["Q"], ["A"],["K"],["Cat"],["Dog"],["Monkey"],["Bird"]]
array_paylines = [["0 3 6 9 12"],["1 4 7 10 13"],["2 5 8 11 14"]]
# play = Board.new(simbol_list)
# board_array = play.random_generator
board_array = Board.new(simbol_list)

#play.print_board
read_line = ReadLine.new(board_array, array_paylines)
read_line.hit!



