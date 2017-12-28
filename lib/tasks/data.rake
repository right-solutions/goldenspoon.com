require 'csv'
require 'open-uri'
require 'time'

namespace 'import' do
  namespace 'data' do

    desc "Import all data in sequence"
    task 'all' => :environment do

      begin

        # First import all Master Data
        puts "Importing Master Data \t".cyan
        
        puts "Importing Features \t".yellow
        Rake::Task["usman:import:master_data:features"].invoke

        puts "Importing Roles \t".yellow
        Rake::Task["usman:import:master_data:roles"].invoke

        # Import Users & Permissions
        puts "Importing Users & Permissions \t".cyan

        puts "Importing Users \t".yellow
        Rake::Task["usman:import:data:users"].invoke

        puts "Importing permissions \t".yellow
        Rake::Task["usman:import:data:permissions"].invoke

        # Import Other Data
        puts "Importing Other Data \t".cyan

        puts "Importing Categories \t".yellow
        Rake::Task["dhatu:import:data:dhatu/categories"].invoke

        puts "Importing Offers \t".yellow
        Rake::Task["dhatu:import:data:dhatu/offers"].invoke

        puts "Importing Prices \t".yellow
        Rake::Task["dhatu:import:data:dhatu/prices"].invoke

        puts "Importing Section Types \t".yellow
        Rake::Task["dhatu:import:data:dhatu/section_types"].invoke

        puts "Importing Sections \t".yellow
        Rake::Task["dhatu:import:data:dhatu/sections"].invoke

        puts "Importing Services \t".yellow
        Rake::Task["dhatu:import:data:dhatu/services"].invoke

        puts "Importing Testimonials \t".yellow
        Rake::Task["dhatu:import:data:dhatu/testimonials"].invoke

        puts "Importing Team Members \t".yellow
        Rake::Task["dhatu:import:data:dhatu/team_members"].invoke

        puts "Importing Promotions \t".yellow
        Rake::Task["dhatu:import:data:dhatu/promotions"].invoke

        puts "Importing Blog Posts \t".yellow
        Rake::Task["dhatu:import:data:dhatu/blog_posts"].invoke
        
        puts "Importing Branches \t".yellow
        Rake::Task["dhatu:import:data:dhatu/branches"].invoke
      
      rescue ArgumentError => e
          puts "Loading data - failed - #{e.message}".red
      rescue Exception => e
        puts "Importing data - failed - #{e.message}".red
        puts "Backtrace:\n\t#{e.backtrace.join("\n\t")}"
      end
      puts " "
      
    end

    ["Feature", "Role"].each do |cls_name|
      name = cls_name.underscore.pluralize
      desc "Load Master Data - #{cls_name.pluralize}"
      task name => :environment do
        puts "Importing #{name} \t".yellow
        Rake::Task["usman:import:master_data:#{name}"].invoke
      end
    end

    ["User", "Permission"].each do |cls_name|
      name = cls_name.underscore.pluralize
      desc "Load Data - #{cls_name.pluralize}"
      task name => :environment do
        puts "Importing #{name} \t".yellow
        Rake::Task["usman:import:data:#{name}"].invoke
      end
    end

    {
      categories: "Dhatu::Category",
      services: "Dhatu::Service",
      sections: "Dhatu::Section",
      section_types: "Dhatu::SectionType",
      events: "Dhatu::Event",
      offers: "Dhatu::Offer",
      prices: "Dhatu::Price",
      testimonials: "Dhatu::Testimonial",
      team_members: "Dhatu::TeamMember",
      branches: "Dhatu::Branch", 
      promotions: "Dhatu::Promotion", 
      promotion_attributes: "Dhatu::PromotionAttribute", 
      blog_posts: "Dhatu::BlogPost"
    }.each do |simple_name, cls_name|
      name = cls_name.underscore.pluralize
      desc "Load Data - #{simple_name.to_s.titleize}"
      task simple_name => :environment do
        puts "Importing #{simple_name.to_s.titleize} \t".yellow
        Rake::Task["dhatu:import:data:#{name}"].invoke
      end
    end

    namespace 'dummy' do
      
      desc "Import all dummy data in sequence"
      task 'all' => :environment do

        begin

          # First import all Master Data
          puts "Importing Master Data \t".cyan
        
          puts "Importing Features \t".yellow
          Rake::Task["usman:import:master_data:features"].invoke

          puts "Importing Roles \t".yellow
          Rake::Task["usman:import:master_data:roles"].invoke

          # Import Users & Permissions
          puts "Importing Users & Permissions \t".cyan

          puts "Importing Users \t".yellow
          Rake::Task["usman:import:data:dummy:users"].invoke

          puts "Importing permissions \t".yellow
          Rake::Task["usman:import:data:dummy:permissions"].invoke

           # Import Other Data
          puts "Importing Other Data \t".cyan

          puts "Importing Categories \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/categories"].invoke

          puts "Importing Offers \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/offers"].invoke

          puts "Importing Prices \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/prices"].invoke

          puts "Importing Section Types \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/section_types"].invoke

          puts "Importing Sections \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/sections"].invoke

          puts "Importing Services \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/services"].invoke

          puts "Importing Testimonials \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/testimonials"].invoke

          puts "Importing Team Members \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/team_members"].invoke

          puts "Importing Promotions \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/promotions"].invoke

          puts "Importing Blog Posts \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/blog_posts"].invoke
          
          puts "Importing Branches \t".yellow
          Rake::Task["dhatu:import:data:dummy:dhatu/branches"].invoke

        rescue ArgumentError => e
            puts "Import Failed - #{e.message}".red
        rescue Exception => e
          puts "Importing Failed - #{e.message}".red
          puts "Backtrace:\n\t#{e.backtrace.join("\n\t")}"
        end
        puts " "

      end

      ["User", "Permission"].each do |cls_name|
        name = cls_name.underscore.pluralize
        desc "Load Data - #{cls_name.pluralize}"
        task name => :environment do
          puts "Importing #{name} \t".yellow
          Rake::Task["usman:import:data:dummy:#{name}"].invoke
        end
      end

      {
        categories: "Dhatu::Category",
        services: "Dhatu::Service",
        sections: "Dhatu::Section",
        section_types: "Dhatu::SectionType",
        events: "Dhatu::Event",
        offers: "Dhatu::Offer",
        prices: "Dhatu::Price",
        testimonials: "Dhatu::Testimonial",
        team_members: "Dhatu::TeamMember",
        branches: "Dhatu::Branch", 
        promotions: "Dhatu::Promotion", 
        promotion_attributes: "Dhatu::PromotionAttribute", 
        blog_posts: "Dhatu::BlogPost"     
      }.each do |simple_name, cls_name|
          name = cls_name.underscore.pluralize
          desc "Load Data - #{simple_name.to_s.titleize}"
          task simple_name => :environment do
            puts "Importing #{simple_name.to_s.titleize} \t".yellow
            Rake::Task["dhatu:import:data:dummy:#{name}"].invoke
          end
      end

    end
  end
end
    