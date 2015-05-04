require_relative 'transparent_link'
require_relative 'logo'
require 'singleton'

module ResumeGenerator
  module Resume
    class SocialMediaLogoSet
      include Singleton, TransparentLink

      attr_reader :pdf, :x_position, :top_padding, :padded_logo_width,
                  :padded_logo_height, :horizontal_rule_colour, :logos
      attr_accessor :x_position

      def self.generate(pdf, logo_set)
        new(
          pdf,
          logo_set[:logos].values,
          logo_set[:logo_properties],
          x_position: logo_set[:x_position],
          top_padding: logo_set[:top_padding],
          padded_logo_width: logo_set[:padded_logo_width],
          padded_logo_height: logo_set[:padded_logo_height],
          horizontal_rule_colour: logo_set[:horizontal_rule_colour],
        ).generate
      end

      def initialize(pdf, logo_values, logo_properties, options)
        @pdf = pdf
        @logos = logos_for(logo_values, logo_properties)
        options.each do |attribute, value|
          instance_variable_set("@#{attribute}", value)
        end
      end

      def generate
        pdf.move_down(top_padding)
        generate_logo_for(logos.first)
        logos[1..-1].each do |logo|
          pdf.move_up(padded_logo_height)
          generate_logo_for(logo)
        end
        pdf.stroke_horizontal_rule { color horizontal_rule_colour }
      end

      private

      def logos_for(logo_set, general_properties)
        logo_set.map do |logo_properties|
          Logo.for(logo_properties.merge(general_properties))
        end
      end

      def generate_logo_for(logo)
        pdf.bounding_box([x_position, pdf.cursor], width: logo.width) do
          pdf.image(
            logo.image,
            fit: logo.fit,
            align: logo.align
          )
          pdf.move_up logo.link_overlay_start
          transparent_link(pdf, logo)
        end
        self.x_position += padded_logo_width
      end
    end
  end
end

