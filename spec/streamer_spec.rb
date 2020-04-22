require 'features/streamer'

describe ElevatorMedia::Streamer do

    describe "testingRspec" do
        context 'testing rspec with hello world' do
            it 'returns hello world' do
                expect(ElevatorMedia::Streamer.testingRspec).to eq("hello world")
            end
        end
    end

    describe "getContent" do
        context 'test for returning valid html' do
            it 'returns a string that starts and end with a div' do
                expect(ElevatorMedia::Streamer.getContent.start_with?("<div>")).to eq(true)
                expect(ElevatorMedia::Streamer.getContent.end_with?("</div>")).to eq(true)
            end
        end
    end

    describe "testPrivateMethod" do
        context 'testing private methods' do
            it 'returns input' do
                expect(ElevatorMedia::Streamer.testPrivateMethod("test")).to eq("test")
            end
        end
    end

    describe "wrapIFrame" do
        context 'test for wrapping the input with an iframe' do
            it 'returns a valid iframe' do
                expect(ElevatorMedia::Streamer.wrapIFrame("Abc23456789")).to eq("<iframe src='https://www.youtube.com/embed/Abc23456789'></iframe>")
            end
        end
    end

    describe "getYtVideoList" do
        context 'test the youtube api for search ' do
            it 'returns a list as a string' do
                expect(ElevatorMedia::Streamer.getYtVideoList).to be_an_instance_of(String)
            end
        end
    end

    # describe "formatRequest" do
    #     context 'formats the content to be ready for an API request' do
    #         it 'returns and URI' do
    #         end
    #     end
    # end

    describe "pickVideoFromList" do
        context 'test for getting a video ID from the list' do
            it 'returns a string of length 11' do
                expect(ElevatorMedia::Streamer.pickVideoFromList.length).to be(11)
            end
        end
    end

end