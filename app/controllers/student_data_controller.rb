class StudentDataController < ApplicationController
  def index
    theseBehaviors = (params[:theseBehaviors]).map(&:to_i)
    thisTotal = (params[:thisTotal]).to_i
    render :json => {
      :type => 'ColumnChart',
      :cols => [['string', 'Behavior'], ['number', 'Number'], [{ type: 'string', role: 'style' }]],
      :rows => [
        ['On Task', theseBehaviors[0], 'purple'],
        ['Positive Interactions', theseBehaviors[1], 'purple'],
        ['Safety', theseBehaviors[2], 'purple'],
        ['B.I.P. Goal', theseBehaviors[3], 'purple'],
        ['Defiant', theseBehaviors[4], 'blue'],
        ['Disrespectful', theseBehaviors[5], 'blue'],
        ['Disruptive', theseBehaviors[6], 'blue'],
        ['Property Distruction', theseBehaviors[7], 'blue'],
        ['Threatening', theseBehaviors[8], 'blue'],
        ['Obsenity', theseBehaviors[9], 'blue'],
        ['Physical Aggression', theseBehaviors[10], 'blue'],
        ['Verbal Aggression', theseBehaviors[11], 'blue'],
        ['AWOL', theseBehaviors[12], 'blue'],
        ['Sleeping', theseBehaviors[13], 'blue'],
        ['Provoking/Mocking', theseBehaviors[14], 'blue'],
        ['Self-Injurious', theseBehaviors[15], 'blue'],
        ['Repeat Offense', theseBehaviors[16], 'blue'],
        ['B.I.P. Goal', theseBehaviors[17], 'blue'],
        ['Tardy', theseBehaviors[18], 'blue'],
        ['Other', theseBehaviors[19], 'blue'],
        ['Time Away', theseBehaviors[20], 'green'],
        ['Time Out', theseBehaviors[21], 'green'],
        ['Seclusion', theseBehaviors[22], 'green'],
        ['Restraint', theseBehaviors[23], 'green'],
      ],
      :options => {
        :title => 'Behaviors this Week',
        :legend => 'none',
        :vAxis => { :maxValue => thisTotal, :gridlines => { :color => '#333', :count => -1 } },
        :width => 700, 
        :height => 600,
        :chartArea => { :width => "90%" },
        :axisTitlesPosition => 'in'
        
      }
    }
  end

  def student_graph
    theseBehaviors = (params[:theseBehaviors])
    thisTotal = (params[:thisTotal])
    render :json => {
      :type => 'ColumnChart',
      :cols => [['string', 'Behavior'], ['number', 'Number'], [{ type: 'string', role: 'style' }]],
      :rows => [
        ['On Task', theseBehaviors[0], 'purple'],
        ['Positive Interactions', theseBehaviors[1], 'purple'],
        ['Safety', theseBehaviors[2], 'purple'],
        ['B.I.P. Goal', theseBehaviors[3], 'purple'],
        ['Defiant', theseBehaviors[4], 'blue'],
        ['Disrespectful', theseBehaviors[5], 'blue'],
        ['Disruptive', theseBehaviors[6], 'blue'],
        ['Property Distruction', theseBehaviors[7], 'blue'],
        ['Threatening', theseBehaviors[8], 'blue'],
        ['Obsenity', theseBehaviors[9], 'blue'],
        ['Physical Aggression', theseBehaviors[10], 'blue'],
        ['Verbal Aggression', theseBehaviors[11], 'blue'],
        ['AWOL', theseBehaviors[12], 'blue'],
        ['Sleeping', theseBehaviors[13], 'blue'],
        ['Provoking/Mocking', theseBehaviors[14], 'blue'],
        ['Self-Injurious', theseBehaviors[15], 'blue'],
        ['Repeat Offense', theseBehaviors[16], 'blue'],
        ['B.I.P. Goal', theseBehaviors[17], 'blue'],
        ['Tardy', theseBehaviors[18], 'blue'],
        ['Other', theseBehaviors[19], 'blue'],
        ['Time Away', theseBehaviors[20], 'green'],
        ['Time Out', theseBehaviors[21], 'green'],
        ['Seclusion', theseBehaviors[22], 'green'],
        ['Restraint', theseBehaviors[23], 'green'],
      ],
      :options => {
        :title => 'Behaviors',
        :legend => 'none',
        :vAxis => { :maxValue => thisTotal, :gridlines => { :color => '#333', :count => -1 } },
        :width => 400, 
        :height => 300,
      }
    }
  end
end