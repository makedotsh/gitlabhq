require 'slack-notifier'

module ChatMessage
  class BaseMessage
    attr_reader :markdown_format

    def initialize(params)
      @markdown_format = params[:markdown_format] || false
    end

    def pretext
      markdown_format ? message : format(message)
    end

    def fallback
    end

    def attachments
      raise NotImplementedError
    end

    def activity
      raise NotImplementedError
    end

    private

    def message
      raise NotImplementedError
    end

    def format(string)
      Slack::Notifier::LinkFormatter.format(string)
    end

    def attachment_color
      '#345'
    end

    def link(text, url)
      "[#{text}](#{url})"
    end
  end
end
