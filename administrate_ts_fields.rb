<%= page.attributes.first.name %>
<%= page.attributes.first.name %>

[#<Administrate::Field::BelongsTo:0x007fd6b08e1730 @attribute=:pet_category, @data=nil, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>, 
#<Administrate::Field::BelongsTo:0x007fd6b08a9a10 @attribute=:location, @data=nil, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>, 
#<Administrate::Field::BelongsTo:0x007fd6b083de78 @attribute=:user_detail, @data=nil, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>, 
#<Administrate::Field::String:0x007fd6b0828280 @attribute=:name, @data=nil, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>, 
#<Administrate::Field::Text:0x007fd6b0806040 @attribute=:description, @data=nil, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>,
#<Administrate::Field::Boolean:0x007fd6b07340b8 @attribute=:published, @data=false, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>,
#<Administrate::Field::Boolean:0x007fd6b0705f10 @attribute=:visible, @data=true, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>, 
#<Administrate::Field::Boolean:0x007fd6b06f7e38 @attribute=:available, @data=true, @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">, @options={}>, 
#<Administrate::Field::String:0x007fd6b06e7470 @attribute=:pet_status, @data="draft", @page=:form, @resource=#<Pet id: nil, name: nil, description: nil, pet_category_id: nil, location_id: nil, created_at: nil, updated_at: nil, published: false, visible: true, available: true, user_detail_id: nil, pet_status: "draft">,
 @options={:searchable=>false}>]
 
   <%= page.attributes.first.name %>  # works
   <%= page.attributes %> # works
   page.resource # works

 <%= page.attributes['user_detail'] %>
 <%= page.attributes.resource %> -
  <%= page.attributes.resources %> -
  
  <%= page.resource.first.name %>
  <%= page.resource.pet_category.nil? %>
  <%- page.resource.user_detail = UserDetail.first %>
  <%= page.resource.user_detail %>
      <%- page.resource.user_detail = @current_owner %>

within the form .. 
 page.attributes.first.page
 page.attributes.first
 page.attributes.first
  
 # not
 attributes[0]['data']
