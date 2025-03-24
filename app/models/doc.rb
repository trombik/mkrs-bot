require "kramdown"

class Doc
  include ActiveModel::Model
  include ApplicationHelper

  def load_path
    Rails.configuration.x.doc.load_path
  end

  def each_file(path = ".", &block)
    return unless block
    glob(path, "*.md").each do |file|
      block.call file
    end
    self
  end

  def each_dir(path = ".", &block)
    return unless block

    glob_dir(path, "**").each do |dir|
      block.call dir
    end
    self
  end

  def show(relative_path)
    text = read_file(load_path / relative_path)
    Kramdown::Document.new(text).to_html
  end

  private

  def read_file(path)
    raise Errno::ENOENT, "#{load_path}, #{path}" unless include_directory?(load_path, path)

    File.read(path)
  end

  def glob(*args)
    path = args.join(File::SEPARATOR)
    Dir.glob(load_path.join(path), base: load_path).map do |path|
      next unless include_directory? load_path, path
      path.gsub(/^#{load_path}#{File::SEPARATOR}/, "")
    end.reject { |file| file.nil? }
  end

  def glob_dir(*args)
    glob(args).select { |path| File.directory? load_path.join path }
  rescue
    pry
  end
end
