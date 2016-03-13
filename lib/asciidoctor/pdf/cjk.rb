require "asciidoctor-pdf"
require "asciidoctor/pdf/cjk/version"
require "asciidoctor/pdf/cjk/converter"

module Asciidoctor
  module Pdf
    module Cjk
      def self.break_words(string)
        string.split(/(<[^>]+>)/).each_slice(2).map do |s,t|
          s.gsub(/(?<!^|\p{Space}|\p{Ps}|\p{Pi})[\p{Han}\p{Hiragana}\p{Katakana}\p{Ps}\p{Pi}]/) {|s| "#{::Prawn::Text::ZWSP}#{s}"} + (t || '')
        end.join('')
      end
    end
  end
end
