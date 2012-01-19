class User                                             # erbt nichts von anderen Klassen
  attr_accessor :name, :email                          # kann zugreifen auf @name und @email

  def initialize(attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end