# This migration comes from dhatu (originally 20171120145547)
class AddSectionTypeIdToSections < ActiveRecord::Migration[5.1]
  def change
  	add_reference :sections, :section_type, index: true

  	begin
	  	Dhatu::Section.all.each do |section|
	  		section_type = Dhatu::SectionType.find_by_code(section.section_type) || Dhatu::SectionType.create(title: section.section_type.titleize, code: section.section_type)
	  		section.update_attribute(section_type_id: section_type.id)
	  	end
	  rescue
	  end

  	remove_column :sections, :section_type
  end
end
