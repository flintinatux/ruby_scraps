module PjaxLayout

  protected
    def self.use_pjax_layout(layout)
      define_method 'pjax_layout' do
        layout.to_s
      end
    end

end # PjaxLayout