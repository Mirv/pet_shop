Resources
Pet  https://github.com/thoughtbot/administrate/blob/master/docs/customizing_dashboards.md
  https://github.com/thoughtbot/administrate/blob/master/docs/adding_custom_field_types.md
  https://github.com/thoughtbot/administrate/issues/302 ... passing arguments into custom fields
  https://www.justinweiss.com/articles/creating-easy-readable-attributes-with-activerecord-enums/ general enums with justin

Plan is to 

- inherit the Fields::Select,
- customize it to work with Pet.pet_status.keys.to_a
- customize somewhere to default

mirv:~/workspace (addNoUserProvided) $ rails g administrate:field select_enum
      create  app/fields/select_enum_field.rb
      create  app/views/fields/select_enum_field/_show.html.erb
      create  app/views/fields/select_enum_field/_index.html.erb
      create  app/views/fields/select_enum_field/_form.html.erb
      
# This next step was wrong ... skip to next comment if not interested in error      
In app/fields/select_enum_field.rb ... class SelectEnumField < Administrate::Field::Select (used to be ::base at the end)

error
  Showing /home/ubuntu/workspace/app/views/admin/pets/_form.html.erb where line #36 raised:
  Attribute pet_status could not be found in PetDashboard::ATTRIBUTE_TYPES

/app/dashboards/pet_dashboard.rb ... pet_status: Field::SelectEnumField replaces old pet_status

error (new)
  NameError in Admin::PetsController#new
  uninitialized constant Administrate::Field::SelectEnumField
  
Went started my db server, then went to rails console (irb would work too but `rails c` loads a bunch for me

I was trying to load my Administrate's PetDashboard to load.  
It wouldn't ... so in console I tried seeing what was initialized

2.3.4 :019 > pdb = a::PetDashboard
NameError: uninitialized constant Administrate::Select
        from /home/ubuntu/workspace/app/fields/select_enum_field.rb:3:in `<top (required)>'
  
Chain of errors lead to wrong inheritance ... 

  /app/fields/select_enum_field.rb
  `class SelectEnumField < Field::Select` was correct in console
  
Still getting server error ...

  NameError in Admin::PetsController#index
  uninitialized constant Field
  Extracted source (around line #3):
  
  class SelectEnumField < Field::Select
  
Going back to `Administrate::Field::Select` seems to either load the class or fail silently on server

Changed _form partial for app/fields/select_enum_field

  <div class="field-unit__label">
    <%= f.label field.attribute %>
  </div>
  <div class="field-unit__field">
    <%= f.select(field.attribute) do %>
      <%= options_for_select(field.associated_resource_options, field.selected_option) %>
    <% end %>
  </div>
  
Error

 NoMethodError in Admin::Pets#new
  Showing /home/ubuntu/workspace/app/views/fields/select_enum_field/_form.html.erb where line #6 raised:
  undefined method `pet_status' for #<Class:0x007f1c877d93d0>
  Did you mean?  pet_statuses

Edit pluralization in method in /app/fields/select_enum_field.rb to ...
    def associated_resource_options
      Pet.pet_statuses.keys.to_a
    end
  
Working drop down of enums for pet_status!

Left over ...
- Needs some titlization etc
- Needs work to pull the entry & stick in the value for the pet_status field
  
  #<Administrate::Field::String:0x007fd6b06e7470 @attribute=:pet_status, @data="draft", @page=:form, @resource=# ... >
  # passes thru the data from @data to the partial below this code
  /app/fields/select_enum_field.rb
  def selected_option
    data
  end

  /app/views/fields/select_enum_field/_form.html.erb
  <%= options_for_select(field.associated_resource_options, field.selected_option) %>
 
 
- need the new page to have the current_user in it
  # note: not happy with this hack
  /app/controllers/admin/pets_controller.rb
    def new
      @current_owner = current_user.user_detail
      super
    end
    
  /app/views/admin/pets/new.html.erb
  <% page.resource.user_detail = @current_owner %>

    <% page.attributes.each do |attribute| -%>
      <div class="field-unit field-unit--<%= attribute.html_class %>">
        <%= render_field attribute, f: f %>
      </div>
    <% end -%>


<div class="field-unit__label">
  <%= f.label field.attribute %>
</div>
<div class="field-unit__field">
  <%= f.select(field.attribute) do %>
    <%= options_for_select(field.associated_resource_options, field.selected_option) %>
</div>


# app/views/fields/select/_form.html.haml
.field-unit__label
  = f.label field.attribute
.field-unit__field
  = f.select(field.attribute) do
    = options_for_select(field.associated_resource_options, field.selected_option)