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
  end  
  
  def random_generator
    15.times do |i|
      value = @simbol_list.shuffle.first
      @simbol_list_random = @simbol_list_random.push(value) 
    end
    print  print  "board: #{@simbol_list_random}" 
    puts
    @simbol_list_random_array = @simbol_list_random.each_slice(5).to_a
    # CODE FOR TEST FORCING THE ENTRY, just comment the 3 lines of above of "Code for test", and delete the character "#" from the following 4 lines   
    #  print  "board: #{@simbol_list_random}" 
    #  puts
    #  array_for_test = [["J"],["J"],["J"], ["Q"],["K"],["Cat"],["Cat"],["Cat"],["Cat"],["Bird"],["Bird"],["Bird"],["Bird"],["Bird"],["Bird"]]
    #  @simbol_list_random_array = array_for_test.each_slice(5).to_a
    # END OF CODE FOR TEST
  end

end

class ReadLine   

  def initialize (board_array, array_paylines)
    @board_array = board_array
    @array_paylines = array_paylines
    # hash to save 
    @payline_and_countmatch = Hash.new
  end
  
  def hit!   
    # cicle to check the array that content the payline, each one is saved in one position into an array [[payline0],[payline1],[payline2]] 
    @board_array.random_generator.each_with_index do |a,index|  
      new_a = []
      #Cicle to compare the characters
      a.each_with_index do |i, index2|
          if index2 == 0
              new_a.push(i)
          elsif new_a[index2 -1] == i
              new_a.push(i)
          else
              new_a = new_a
          end
      end
      #print  "Matching with index:  #{index} and  #{new_a.length} times "
      #puts

      # Values are addedd to the hash if the matches greater than 2
      if new_a.length > 2
        @payline_and_countmatch[@array_paylines[index]] = new_a.length      
      end     
    end

    # If found matches print the payline(s)
    if @payline_and_countmatch.length != 0  
      print "paylines: #{@payline_and_countmatch}"
      puts
      bet_compute
    else
      puts "Sorry Not Won, execute again the script, ruby slot.rb" 
    end

  end

  def bet_compute
    gain = 0
    bet = 100
    @payline_and_countmatch.each do |payline, n_matches| 
      if n_matches == 3
        gain = gain + bet*0.2              
      elsif n_matches == 4
        gain = gain + bet*2               
      else
        gain = gain + bet*10       
      end
    end
    print "bet_amount: #{bet}"
    puts
    puts "total_win:  #{gain}"
  end

end

simbol_list = [["10"],["J"],["Q"], ["A"],["K"],["Cat"],["Dog"],["Monkey"],["Bird"]]
array_paylines = ["0 3 6 9 12","1 4 7 10 13","2 5 8 11 14"]
board_array = Board.new(simbol_list)
read_line = ReadLine.new(board_array, array_paylines)
read_line.hit!



