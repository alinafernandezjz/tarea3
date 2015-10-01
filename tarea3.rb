class Node

	def initialize(d)
		set_dato(d)	
		set_sig(nil)
	end

	def get_dato
		return @dato
	end

	def set_dato(d) 
		@dato=d
	end

	def get_sig 
		return @sig
	end

	def set_sig(s)
		@sig=s
	end

end

class LinkedList #borrar nodo, imprimirlo , agregarlo

	def initialize() #valor inicial
		@head = nil #apunta al primer nodo de la lista
	end

	def add(d) #se va hasta el final de la lista para agregar nuevo valor
		nuevo=Node.new(nil)
		nuevo.set_dato(d)
		if @head.nil?
			@head=nuevo
		else
			tem=@head# inicia el recorrido en el principio
			while (tem.get_sig!=nil)
				tem=tem.get_sig #va al siguiente elemento de la lista	
			end
			tem.set_sig(nuevo)
		end
	end

	def delete(d)
		temp=@head
		if(temp.get_dato==d)
			@head=@head.get_sig
		else
			while(temp!=nil && temp.get_sig!=nil && (temp.get_sig).get_dato!=d)
				temp=temp.get_sig
			end
			if(temp!=nil && temp.get_sig!=nil)
				temp.set_sig((temp.get_sig).get_sig)
			end
		end
	end

	def display
		temp=Node.new(nil)
		temp=@head
		contenido=""
		while(not temp.nil?)
			if(temp.get_sig!=nil)
				contenido=contenido+temp.get_dato.to_s+","
			else
				contenido=contenido+temp.get_dato.to_s
			end
			temp=temp.get_sig
		end
		return contenido
	end

	def count
		elements=0
		temp=@head
		while(not temp.nil?)
			elements=elements+1
			temp=temp.get_sig
		end
		return elements
	end
end 

myList=LinkedList.new()
value=gets.chomp()

if (not value=="-1")
	myList.add(value)
end

while (not value=="-1")
	value= gets.chomp()
	if ((not value=="-1") && (not value==""))
		myList.add(value)	
	end
end

if(myList.count>0)
	puts ("List: "+ myList.display)
end
