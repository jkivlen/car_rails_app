module CarsHelper

    def display_four_wheel_drive(car)

        if car.four_wheel_drive 
            content_tag(:h3, "Four Wheel Drive")
        else 
            content_tag(:p, "Two Wheel Drive")
        end 
    end

    def display_header(make)
        if make 
            content_tag(:h1, "All #{make.name}'s Cars")
        else 
            content_tag(:h1, "All the Cars")
        end 
    end

    def display_make_fields(make, f)
        if make
           f.hidden_field :make_id 
            
        else
            render partial: "make_select", locals: {f: f}
        end

    end

end
