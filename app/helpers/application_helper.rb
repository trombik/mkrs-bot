# frozen_string_literal: true

# A helper for application
module ApplicationHelper
  # A method to test if target_path is included in base_dir.
  def include_directory?(base_dir, target_path)
    base = Pathname.new(base_dir).realpath
    target = Pathname.new(target_path).realpath
    return true if target.to_s == base.to_s

    target.to_s.start_with?(base.to_s + File::SEPARATOR)
  rescue StandardError
    false
  end

  def class_id(obj)
    obj.class.to_s.underscore.gsub("/", "_")
  end
end
