require 'test_helper'

# more information on testing see test.md
class SubmitSequenceControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "testing SequenceSubmitter concern" do
  	fasta_array = ">8657036VS\nMGKFHLTLSRRDFMKSLGLAGAGLATVKVGTPVFHDLDEVISNENSNWRRPWWVKEREFDKPTVDVDWGI
  	YKRFDKFTYAPANARIAMFGQEAVMKANQDWNNLVAKRLQEDTAGFTIRDRAMDEGLCEEGINGGYPAPRTASLPQDLADMADPPIVLSKGRWEG
  	TPEENSRMVRCVLKLAGAGSVAFGVASEDKAEKFIYTHEHVWGDFKHYKIGDYDDIWEDEETRYHPHKCKYMITYTIPESEELLRRAPSNFAEATV
  	DQAYSESRVIFGRMTNFLWALGKYICGGDCSNAHSIHTATAAWTGLSECSRMHQQTISSEFGNIMRQFCIWTDLPLAPTPPIDMGIMRYCLTCKKCAD
  	TCPSGAISHEDPTWERAFAPYCQEGVYDYDFSHAKCSQFWKQSSWGCSMCTGSCPFGHKNYGTVHDVISATAAVTPIF
  	\n>8657042VS\nMEMNIYHSTISRRNFMKGLGLSGAALGAATASAPVFHDLDEMITSVPKSTTQHAWWVKERDYEDITTPV
  	DWTVWSRREALKNPMPPGFAGNYVPKEQARLQSFRDEIKRGITEKIPGATLRDWALSEAGRSNTTSSSWMGLDVKPPWLWGEASA
  	LPVEPWPEGAPKWESTPEDNLRTVQAAGHYFGTPQVGAMEINEHMIRMFDKDGFEHNYSESYEKPMMRFRSEWFEDIPVGFQDAN
  	QVKHIPKSCKWAVTYIAAKENALQMTYGMRTGDPQDPWYKRIFPLGYTTGEAYSKADYVKVQFMKFIKMLGYQTYYMGLAGGTSSN
  	SPAGVFSGLAEEARPALACSPYYGNAVRHIGIIVTDMPLSPTKPIDAGIVNFCKVCKKCAETCPSGAISMETEQQWEPACTGNNPGR
  	KTWYLDWFKCRPWGSPYYC"

  	uploading_result = submit_sequence_caller(fasta_array)


  	# {:header=>"8657036VS", :status=>"FAILED", :msg=>"Your sequence doesn't share 90% of representatives of the group at aa level."}
  	# {:header=>"8657042VS", :status=>"SUCCESS", :msg=>"Your sequence belongs 27"}

  	assert(uploading_result[0][:header], "8657036VS")
  	assert(uploading_result[0][:status], "FAILED")
  	assert(uploading_result[1][:header], "8657042VS")
  	assert(uploading_result[1][:status], "SUCCESS")


  end
end
