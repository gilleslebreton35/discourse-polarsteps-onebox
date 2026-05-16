# name: discourse-polarsteps-onebox
# about: Transforme les liens de voyage Polarsteps en cartes interactives (Onebox)
# version: 1.3
# authors: Stylevan Club
# url: https://github.com/votre-compte/discourse-polarsteps-onebox

after_initialize do
  class Onebox::Engine::PolarstepsOnebox
    include Onebox::Engine

    # Cette REGEXP est modifiée pour attraper l'ID même s'il y a un tiret, du texte ou des variables après
    REGEXP = /^https?:\/\/(?:www\.)?polarsteps\.com\/[^\/]+\/([0-9]+)(?:-[^\/\?]+)?/
    matches_regexp REGEXP

    def to_html
      # On isole proprement l'ID numérique du voyage
      trip_id = match[1]
      
      <<-HTML
        <div class="polarsteps-onebox-container" style="margin: 15px 0; position: relative; width: 100%; max-width: 100%; overflow: hidden; border-radius: 12px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);">
          <iframe 
            src="https://www.polarsteps.com/embed/v2/trip/#{trip_id}" 
            width="100%" 
            height="600" 
            frameborder="0" 
            style="border:0; border-radius:12px; width:100%; height:600px; display:block;" 
            allowfullscreen>
          </iframe>
        </div>
      HTML
    end
  end
end
