#Normalmente non si usano le parentesi tonde
puts "Hello world"

#Operazioni con le stringhe in ordine ribaltamento lunghezza coppia 6 volte e upercase
puts "Trento".reverse
puts "Trento".length
puts "Trento"*6
puts "Trento".upcase
#Fa la stessa cosa dell'ultima istruzione
"Trento".send(:*,6)
#Per le conversioni in intero
"42".to_i
#Per le conversioni in float
"42.34".to_f
#_ nella shell da l'ultimo risultato
#ritorna il tipo della classe
puts "42.34".to_f.class
#si possono dichiarare un operatore (simbolo)
operatore = :/
puts 34.send(operatore,6)
#dichiarazione variabili
num = 30
#array
puts [1,2,3]
#ruby contiene tante funzioni
puts [79,99,1,15].sort
puts [79,99,1,15].max
puts [79,99,1,15].last
puts [79,99,1,15].reverse
#posso accedere ai singoli carrateri
puts "Valsugana"[4]
#posso ottenere un array
puts "Valsugana".chars.to_a
#posso unire un array
puts ['a','b'].join
#sort! sovrascrive l'array non esiste per tutte le funzioni
array = [-5,-28,6]
array.sort!
puts array
#esiste anche la convenzione ? per indicare qualcosa che restituisce un binario
puts [1,2,3].include? 3
#posso verificare se un array è vuoto
puts [].empty?
#Esistono i simboli che sono utili in quanto occupano meno memoria rispetto
#a una stringa e non deve essere scritto più volte in memoria se usato più volte
#I simboli sono più o meno equivalenti alle costanti di compilazione
#Alcuni simboli sono già definiti
#:buono
#dizionari o hashtable in ruby sono molto più semplici
{chiave:'valore'}
{}
#dizionari con più hash
{chiave:"valore",roma:"freesco"}
food = {}
food['Pizza'] = :molto_buono
food['Carciofo'] = :molto_buono
food['Aragosta'] = :ottimo
#esiste anche quì il length
puts food.length
#Un nuovo hash per aggiungere dei campi poi va inizializzato nella forma
res = Hash.new 0
#iteratori
#each se gli scorre tutti ed esegue il codice dentro il blocco che può avere questa forma oppure su più righe
# | value | vengono chiamati blocks e contengono le variabili usate
food.each { |chiave, valore| puts chiave + "=" + valore.to_s }
#operazioni su più linee
[10,40,43,32].each do |value|
    res[value] += 1
end
#si può simulare un for tramite l'uso della struttura
(1...100).each { |value| res[value] += 1 }
#map fa un ciclo nella collezione e crea un array con all'interno i valori modificati hai la certezza
#della stessa lunghezza
#to_s converte in una stringa
puts food.map { |chiave, valore| chiave + ":" + valore.to_s }
#se noi facciamo un blocco che non restituisce niente crea un array di egual dimensioni di nil
puts food.map { |chiave, valore| puts 'ciao' }
#select estra alcuni numeri
#even dice se è pari oppure no
puts [10,40,43,32].select { |value| value.even? }
#reduce è utile per fare una serie di operazioni carraterizate da una accumulazione che viene restituita alla fine
(1..100).reduce(0) { |n, acc| acc += n; n }
#operazioni condizionali
#possono essere su una sola riga
puts "empty" if food.empty?
#oppure su più righe
if food.empty? then
    puts "empty"
end
#esistono gli else if e gli else
#attenzione all'else if che è elsif e non elseif
s = "a string"
if s.empty? then
  "The string is empty"
elsif s.length < 4
  "The string is nonempty and its length is less than 4"
elsif s.length == 4
  "The string is nonempty and its length is 4"
else
  "The string is nonempty and its length is more than 4"
end
#there are the word unless to indicate negation
puts "food is not empty (if after)" if !food.empty?
#it can be before or after
#the { ... } syntax isn't admitted
if !food.empty? then
    puts "food is not empty (if block)"
end
#in ruby è tutto truthy
if 1
    puts "true"
end
if 0
    puts "true"
end
#a parte nil
if nil
    puts "true"
end
#is equal to the use of negation
puts "food is not empty (unless)" unless food.empty?

#Dichiarazione di una funzione
def palindrome? (word)
    word.reverse == word
end

#L'ultima espressione è il return di una funzione
def helloWord (word)
     "hello word"
end

#Dichiarazione di una classe
class Frutta
    #Metodo costruttore
    def initialize
        @pesce = "radio"
    end
    #Metodi
    def palindrome? (word)
        word.reverse == word
    end
    #Variabili di istanza
    @pesce = "persico"
    #Per stampare le variabili
    def helloPesce
        #You can sum the string
        "Hello " + @pesce
        #Or you can use interpolation
        "Hello #{@pesce}"
    end

    #You can define private method by the keyword private
    private
    def cry
        "#{@pesce} cry"
    end

    #You can define class method (static)
    def self.helloPesce(pesce)
        "Hello " + pesce
    end

    #CONSTANT are write with upper
    #variable are declared lower
    CONSTANT = "This is a constant"
    variable = "This is a variable"
    #@ declared variable instance
    @radio

    #to access to a variable we have to declare a getter or a setter
    #one method are declare a series of function
    # def pesce
    #    @pesce
    # end
    #we have to add = to declaration to make set method
    # def pesce=(pesce)
    #     @pesce = pesce
    # end
    #we can declare getter and setter with the attribute
    # attr_reader :pesce
    # attr_writer :pesce
    
    # Combine attr_reader and attr_writer
    #They have to explicit make public
    public
    attr_accessor :pesce

    #obviously we can redefine standard method
    def to_s
        "Pesce: #{@pesce}."
    end
end

#You can extend a class
class Word < String
    def palindrome?
        #self è l'equivalente di this e restituisce la istanza che l'ha chiamato o dove è stato dichiarato
		self == self.reverse
	end
end
#and now we can access to all method of string
puts Word.new("level").palindrome?

#Or redefine it
class String
    def palindrome?
      self == self.reverse
    end
end
#So now we can make
puts "name".palindrome?

#Creare una nuova istanza
fruit1 = Frutta.new
fruit2 = Frutta.new

#the two object are different but they have the same parameter
puts fruit1 == fruit2

#we have to check every parameter of the object ot compare it really
puts fruit1.pesce == fruit2.pesce

#each ruby class have some default method that aren't declare from the programmer
puts fruit1.nil?
puts fruit1.class

#to know what method are declared you can use instance_methods
puts Frutta.instance_methods
#to know what method are declared by you, you can use instance_ethods with parameter false
puts Frutta.instance_methods false

#insert the first not false variable into the x (funky inizialization)
a = nil
x = a || "false"
puts x

#or you can insert a default value into a variable if isn't inizalized
elle = elle || "default"
puts elle
#it can be semplific to
radio ||= "default"
puts radio