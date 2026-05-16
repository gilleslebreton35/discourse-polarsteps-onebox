# name: discourse-polarsteps-onebox
# about: Transforme les liens de voyage Polarsteps en cartes interactives (Onebox)
# version: 1.1
# authors: Stylevan Club
# url: https://github.com/votre-compte/discourse-polarsteps-onebox

register_asset "stylesheets/polarsteps-onebox.scss"

after_initialize do
  class Onebox::Engine::PolarstepsOnebox
    include Onebox::Engine

    # Détection des liens de voyage Polarsteps
    REGEXP = /^https?:\/\/(?:www\.)?polarsteps\.com\/[^\/]+\/([0-9]+)/
    matches_regexp REGEXP

    def to_html
      trip_id = match[1]
      
      <<-HTML
        <div class="polarsteps-onebox-container">
          <iframe 
            src="https://www.polarsteps.com/embed/v2/trip/#{trip_id}" 
            width="100%" 
            height="600" 
            frameborder="0" 
            style="border:0; border-radius:12px; width:100%; height:600px;" 
            allowfullscreen>
          </iframe>
        </div>
      HTML
    end
  end
end
