class Contact < ApplicationRecord
    belongs_to :kind, optional: true

    def author
        "v1n1c1u5ouza"
    end

    def kind_description
        self.kind.description
    end 
        
    def as_json(options={})
        super(
            root: true, methods: [:kind_description, :author], include: { kind: { only: :description }}
        )
    end
      
end
