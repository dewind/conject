require 'object_context'
require 'set'

class ObjectContext::CompositionError < RuntimeError
  def initialize(opts={})
    object_def = opts[:object_definition]
    required = opts[:required]
    provided = opts[:provided]

    msg = "Wrong components when building new #{object_def.owner}: "

    missing = required - provided
    msg << "Missing required object(s) #{missing.to_a.inspect}. " unless missing.empty?

    unexpected = provided - required
    msg << "Encountered unexpected object(s) #{unexpected.to_a.inspect}. " unless unexpected.empty?

    super msg
  end
end
