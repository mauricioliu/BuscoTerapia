class EventSeries < ActiveRecord::Base
  after_create :create_recurrent_events
  attr_accessor :title
  
  belongs_to :terapeuta
  has_many :events, :dependent => :destroy

  def create_recurrent_events
    end_time = 5.year.from_now
    st = starts_at
    et = ends_at
    p = r_period(period)
    nst, net = st, et
    
    while frequency.send(p).from_now(st) <= end_time
#      puts "#{nst}           :::::::::          #{net}" if nst and net
      self.events.create(:terapeuta_id => terapeuta_id, :title => title, :starts_at => nst, :ends_at => net)
      nst = st = frequency.send(p).from_now(st)
      net = et = frequency.send(p).from_now(et)
      
      if period.downcase == 'mensualmente' or period.downcase == 'anualmente'
        begin 
          nst = DateTime.parse("#{starts_at.hour}:#{starts_at.min}:#{starts_at.sec}, #{starts_at.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{ends_at.hour}:#{ends_at.min}:#{ends_at.sec}, #{ends_at.day}-#{et.month}-#{et.year}")
        rescue
          nst = net = nil
        end
      end
    end
  end

  def r_period(period)
    case period
      when 'Diariamente'
      p = 'days'
      when "Semanalmente"
      p = 'weeks'
      when "Mensualmente"
      p = 'months'
      when "Anualmente"
      p = 'years'
    end
    return p
  end
end
