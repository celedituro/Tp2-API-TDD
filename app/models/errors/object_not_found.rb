class ObjectNotFound < StandardError
  attr_reader :model

  # rubocop: disable Lint/MissingSuper
  def initialize(model, id)
    @model = model
    @id = id
  end
  # rubocop: enable Lint/MissingSuper
end
