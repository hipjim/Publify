# == Schema Information
# Schema version: 20110208195705
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)     not null
#  email              :string(255)     not null
#  telephone          :string(255)
#  encrypted_password :string(255)     not null
#  salt               :string(255)     not null
#  admin              :boolean(1)
#  location_id        :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#
# Project Publify
# Author Cristian Ionitoiu 17.01.2011
# Encodes a user 
require 'digest'

class User < ActiveRecord::Base

	#fields
	attr_accessor :password, :location_name
	attr_accessible :name, :email, :telephone, :location_name, :password, :password_confirmation

	#associations
	#------------
	#a user may have an optional location
	# no changes are currently allowed to the association object - maybe the generated methods
	# create_location and build_location whould be overridden to empty stubs
	# is user changes its location -> foreign key must be replaced, but associated object remails read-only
	belongs_to :location, :readonly => true

	#each user publishes at least one Ad
	has_many :ads

    #each user receives many feedbacks
	has_many :feedbacks

	#validations
	#-----------
	validates :name, :presence => true, :length => { :within => 4..30 }
	validates :email, :presence => true, 
			  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
			  :uniqueness => { :case_sensitive => false }
	validates :telephone, :format => { :with => /\A0[1-9][0-9]+\z/, :on => :create },
			      :length => { :is => 10 }
	validates :password, :presence     => true,
                       	     :confirmation => true,
                             :length       => { :within => 6..40 }
	#location_name?

	before_save :encrypt_password, :extract_location
	before_create :clearup

	# Return true if the user's password matches the submitted password.
  	def has_password?(submitted_password)
    		# Compare encrypted_password with the encrypted version of
    		# submitted_password.
		encrypted_password == encrypt(submitted_password)
  	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil  if user.nil?
    	return user if user.has_password?(submitted_password)
  	end

	def self.authenticate_with_salt(id, cookie_salt)
    		user = find_by_id(id)
    		(user && user.salt == cookie_salt) ? user : nil
  	end

	def self.basic_user(name, email)
		#the most basic user contains just an email
		return nil if email == nil
		user = User.new(:name => name, :email => email)
	end

  private
		def to_name
			@name
		end

        def extract_location
			return if location_name.nil?
			if Location.isPostcode(location_name) 
		  		#Postcode is not unique, might return more than one location
		  		#Need to show selection div for user to select a location from the list
            	#Replace search with find_Location.all_by_postcode(location_name
		  		loc = Location.find_by_postcode(location_name)
			else
		  		loc = Location.find_by_location_name(location_name)
			end
			if !loc.nil?
                self.location = loc
			end
        end

    	def encrypt_password
            #if password is nil then the row is saved for other values 
			return if password.nil? 
      		self.salt = make_salt if new_record?
      		self.encrypted_password = encrypt(password)
    	end

    	def encrypt(string)
      		secure_hash("#{salt}--#{string}")
    	end

		def make_salt
      		secure_hash("#{Time.now.utc}--#{password}")
    	end

    	def secure_hash(string)
      		Digest::SHA2.hexdigest(string)
    	end

		def clearup
			#eliminates white spaces from fields
		end
end
