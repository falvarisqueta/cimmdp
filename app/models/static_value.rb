StaticValue = Struct.new(:id, :name) do
  def code
    name.parameterize.underscore
  end
end
