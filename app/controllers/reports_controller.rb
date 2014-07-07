class ReportsController < ApplicationController
  
  def show
    @measurements = Measurement.all
      if params[:measurement_id]
      @report = Measurement.find(params[:measurement_id])
      @logs = @report.logs.map { |m| m.amount }
      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => @report.name.capitalize)
        f.xAxis(:categories => [@logs[-7].nil? ? "Not Recorded" : @report.logs[-7].created_at.strftime('%a %d %b'), 
                                @logs[-6].nil? ? "Not Recorded" : @report.logs[-6].created_at.strftime('%a %d %b'), 
                                @logs[-5].nil? ? "Not Recorded" : @report.logs[-5].created_at.strftime('%a %d %b'), 
                                @logs[-4].nil? ? "Not Recorded" : @report.logs[-4].created_at.strftime('%a %d %b'), 
                                @logs[-3].nil? ? "Not Recorded" : @report.logs[-3].created_at.strftime('%a %d %b'),  
                                @logs[-2].nil? ? "Not Recorded" : @report.logs[-2].created_at.strftime('%a %d %b'), 
                                @logs[-1].nil? ? "Not Recorded" : @report.logs[-1].created_at.strftime('%a %d %b') ])
        f.series(:color => "orange", :name => "#{@report.name} in #{@report.unit}", :yAxis => 0, :data => [@logs[-7], @logs[-6], @logs[-5], @logs[-4], @logs[-3], @logs[-2] , @logs[-1] ])

        f.yAxis [
          {:title => {:text => @report.unit, :margin => 10} },
        ]

        f.chart({:defaultSeriesType=>"line"})
      end
    end
  end
end
