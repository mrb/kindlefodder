require 'kindlefodder'

class ZeromqGuide < Kindlefodder
  def get_source_files
    start_url = "http://zguide.zeromq.org/page:all"

    @start_doc = Nokogiri::HTML run_shell_command("curl -s #{start_url}")

    File.open("#{output_dir}/sections.yml", 'w'){|f|
      f.puts extract_sections.to_yaml
    }
  end

  def document
    {
      'title' => 'ZeroMQ Guide',
      'cover' => nil,
      'masthead' => nil,
    }
  end

  def extract_sections
    @start_doc.search('[@id=toc-list] div').map{|o|
      puts o.inner_text
    }
    []
  end

  def get_sections html

  end
end

ZeromqGuide.generate
