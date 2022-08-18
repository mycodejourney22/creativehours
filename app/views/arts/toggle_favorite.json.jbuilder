json.form render(partial: "devise/shared/svg", formats: :html, locals: { art: @art})
json.new_form render(partial: "pages/home", formats: :html, locals: {art: @art})
