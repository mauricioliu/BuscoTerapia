class Event < ActiveRecord::Base
  attr_accessor :period, :frequency
  
  belongs_to :terapeuta
  belongs_to :event_series
  
  REPEATS = [
              "No se repite",
              "Diariamente"    ,
              "Semanalmente"   ,
              "Mensualmente"   ,
              "Anualmente"         
  ]
  
  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}
  
  validates_presence_of :starts_at, :ends_at
  
  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => "",
      :start => starts_at.rfc822,
      :end => ends_at.rfc822,
      :allDay => false,
      :recurring => true,
      :url => Rails.application.routes.url_helpers.event_path(id)
    }
    
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
end
