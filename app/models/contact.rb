class Contact < ApplicationRecord
    belongs_to :kind

    def author
        "v1n1c1u5ouza"
    end
    
    def as_json(options={})
        super(methods: :author, root: true)
    end
      
end
