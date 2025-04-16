module Jekyll
  class SvgFillInjectorTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @file = input.strip.gsub(/^['"]|['"]$/, '')
    end

    def render(context)
      begin
        site = context.registers[:site]

        file_path = File.join(site.source, "_includes", @file)
        return "<!-- SVG not found: #{@file} -->" unless File.exist?(file_path)

        svg = File.read(file_path)
        fill = context['fill_color'] || 'currentColor'

        # Replace or inject fill into every <path> tag
        svg.gsub(/<path[^>]*?>/) do |match|
          if match =~ /fill=/
            match.gsub(/fill=".*?"/, "fill=\"#{fill}\"")
          else
            match.sub(/<path/, "<path fill=\"#{fill}\"")
          end
        end
      rescue => e
        "<!-- SVG plugin error: #{e.message} -->"
      end
    end
  end
end

Liquid::Template.register_tag('svg_fill', Jekyll::SvgFillInjectorTag)