defmodule TlakauakWeb.InputHelpers do
  use Phoenix.HTML

  def input(form, field, opts \\ []) do
    type = opts[:using] || Phoenix.HTML.Form.input_type(form, field)

    wrapper_opts = [class: "input-group input-group-sm mb-3 #{state_class(form, field)}"]
    label_opts = [class: "input-group-text"]
    input_opts = [class: "form-control"]

    content_tag :div, wrapper_opts do
      label = label(form, field, humanize(field), label_opts)
      input = input(type, form, field, input_opts)
      error = TlakauakWeb.ErrorHelpers.error_tag(form, field)
      [label, input, error || ""]
    end
  end
  defp state_class(form, field) do
    cond do
      # The form was not yet submitted
      is_nil(form.source.action) -> ""
      # The field has error
      form.errors[field] -> "has-error"
      # The field is blank
      input_value(form, field) in ["", nil] -> ""
      # The field was filled successfully
      true -> "has-success"
    end
  end
  defp input(type, form, field, input_opts) do
    apply(Phoenix.HTML.Form, type, [form, field, input_opts])
  end
end


# <div class="mb-3">
# <div class="form-group "><label class="control-label" for="promovido-form_clave">Clave</label><input class="form-control" id="promovido-form_clave" name="promovido[clave]" type="text" value="0323071307548"></div>
#   </div>

#   <div class="input-group input-group-sm mb-3">
#   <span class="input-group-text" id="inputGroup-sizing-sm">Small</span>
#   <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
# </div>