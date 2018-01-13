%% Generated by the Erlang ASN.1 BER compiler. Version: 5.0.3
%% Purpose: Encoding and decoding of the types in Fingerprints.

-module('Fingerprints').
-compile(nowarn_unused_vars).
-dialyzer(no_improper_lists).
-include("Fingerprints.hrl").
-asn1_info([{vsn,'5.0.3'},
            {module,'Fingerprints'},
            {options,[der_bin,{i,"../condition"},{i,"."}]}]).

-export([encoding_rule/0,maps/0,bit_string_format/0,
         legacy_erlang_types/0]).
-export(['dialyzer-suppressions'/1]).
-export([
enc_PrefixFingerprintContents/2,
enc_ThresholdFingerprintContents/2,
enc_RsaFingerprintContents/2,
enc_Ed25519FingerprintContents/2
]).

-export([
dec_PrefixFingerprintContents/2,
dec_ThresholdFingerprintContents/2,
dec_RsaFingerprintContents/2,
dec_Ed25519FingerprintContents/2
]).

-export([info/0]).

-export([encode/2,decode/2]).

encoding_rule() -> ber.

maps() -> false.

bit_string_format() -> bitstring.

legacy_erlang_types() -> false.

encode(Type, Data) ->
try iolist_to_binary(element(1, encode_disp(Type, Data))) of
  Bytes ->
    {ok,Bytes}
  catch
    Class:Exception when Class =:= error; Class =:= exit ->
      Stk = erlang:get_stacktrace(),
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.

decode(Type, Data) ->
try decode_disp(Type, element(1, ber_decode_nif(Data))) of
  Result ->
    {ok,Result}
  catch
    Class:Exception when Class =:= error; Class =:= exit ->
      Stk = erlang:get_stacktrace(),
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.

encode_disp('PrefixFingerprintContents', Data) -> enc_PrefixFingerprintContents(Data);
encode_disp('ThresholdFingerprintContents', Data) -> enc_ThresholdFingerprintContents(Data);
encode_disp('RsaFingerprintContents', Data) -> enc_RsaFingerprintContents(Data);
encode_disp('Ed25519FingerprintContents', Data) -> enc_Ed25519FingerprintContents(Data);
encode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

decode_disp('PrefixFingerprintContents', Data) -> dec_PrefixFingerprintContents(Data);
decode_disp('ThresholdFingerprintContents', Data) -> dec_ThresholdFingerprintContents(Data);
decode_disp('RsaFingerprintContents', Data) -> dec_RsaFingerprintContents(Data);
decode_disp('Ed25519FingerprintContents', Data) -> dec_Ed25519FingerprintContents(Data);
decode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

info() ->
   case ?MODULE:module_info(attributes) of
     Attributes when is_list(Attributes) ->
       case lists:keyfind(asn1_info, 1, Attributes) of
         {_,Info} when is_list(Info) ->
           Info;
         _ ->
           []
       end;
     _ ->
       []
   end.


%%================================
%%  PrefixFingerprintContents
%%================================
enc_PrefixFingerprintContents(Val) ->
    enc_PrefixFingerprintContents(Val, [<<48>>]).

enc_PrefixFingerprintContents(Val, TagIn) ->
{_,Cindex1,Cindex2,Cindex3} = Val,

%%-------------------------------------------------
%% attribute prefix(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute maxMessageLength(2) with type INTEGER
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_integer(Cindex2, [<<129>>]),

%%-------------------------------------------------
%% attribute subcondition(3)   External CryptoConditions:Condition
%%-------------------------------------------------
   {EncBytes3,EncLen3} = 'CryptoConditions':'enc_Condition'(Cindex3, [<<162>>]),

   BytesSoFar = [EncBytes1, EncBytes2, EncBytes3],
LenSoFar = EncLen1 + EncLen2 + EncLen3,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_PrefixFingerprintContents(Tlv) ->
   dec_PrefixFingerprintContents(Tlv, [16]).

dec_PrefixFingerprintContents(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute prefix(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

%%-------------------------------------------------
%% attribute maxMessageLength(2) with type INTEGER
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = begin
Val1 = decode_integer(V2, [131073]),
if 0 =< Val1, Val1 =< 4294967295 ->
Val1;
true ->
exit({error,{asn1,bad_range}})
end
end,

%%-------------------------------------------------
%% attribute subcondition(3)   External CryptoConditions:Condition
%%-------------------------------------------------
[V3|Tlv4] = Tlv3, 
Term3 = 'CryptoConditions':'dec_Condition'(V3, [131074]),

case Tlv4 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv4}}}) % extra fields not allowed
end,
Res1 = {'PrefixFingerprintContents',Term1,Term2,Term3},
Res1.


%%================================
%%  ThresholdFingerprintContents
%%================================
enc_ThresholdFingerprintContents(Val) ->
    enc_ThresholdFingerprintContents(Val, [<<48>>]).

enc_ThresholdFingerprintContents(Val, TagIn) ->
{_,Cindex1,Cindex2} = Val,

%%-------------------------------------------------
%% attribute threshold(1) with type INTEGER
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_integer(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute subconditions(2) with type SET OF
%%-------------------------------------------------
   {EncBytes2,EncLen2} = 'enc_ThresholdFingerprintContents_subconditions'(Cindex2, [<<161>>]),

   BytesSoFar = [EncBytes1, EncBytes2],
LenSoFar = EncLen1 + EncLen2,
encode_tags(TagIn, BytesSoFar, LenSoFar).



%%================================
%%  ThresholdFingerprintContents_subconditions
%%================================
enc_ThresholdFingerprintContents_subconditions(Val, TagIn) ->
      {EncBytes,EncLen} = 'enc_ThresholdFingerprintContents_subconditions_components'(Val,[],0),
   encode_tags(TagIn, EncBytes, EncLen).

'enc_ThresholdFingerprintContents_subconditions_components'([], AccBytes, AccLen) -> 
   {lists:reverse(AccBytes),AccLen};

'enc_ThresholdFingerprintContents_subconditions_components'([H|T],AccBytes, AccLen) ->
   {EncBytes,EncLen} = 'CryptoConditions':'enc_Condition'(H, []),
   'enc_ThresholdFingerprintContents_subconditions_components'(T,[EncBytes|AccBytes], AccLen + EncLen).



dec_ThresholdFingerprintContents(Tlv) ->
   dec_ThresholdFingerprintContents(Tlv, [16]).

dec_ThresholdFingerprintContents(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute threshold(1) with type INTEGER
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = begin
Val1 = decode_integer(V1, [131072]),
if 1 =< Val1, Val1 =< 65535 ->
Val1;
true ->
exit({error,{asn1,bad_range}})
end
end,

%%-------------------------------------------------
%% attribute subconditions(2) with type SET OF
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = 'dec_ThresholdFingerprintContents_subconditions'(V2, [131073]),

case Tlv3 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv3}}}) % extra fields not allowed
end,
Res1 = {'ThresholdFingerprintContents',Term1,Term2},
Res1.
'dec_ThresholdFingerprintContents_subconditions'(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),
['CryptoConditions':'dec_Condition'(V1, []) || V1 <- Tlv1].




%%================================
%%  RsaFingerprintContents
%%================================
enc_RsaFingerprintContents(Val) ->
    enc_RsaFingerprintContents(Val, [<<48>>]).

enc_RsaFingerprintContents(Val, TagIn) ->
{_,Cindex1} = Val,

%%-------------------------------------------------
%% attribute modulus(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

   BytesSoFar = [EncBytes1],
LenSoFar = EncLen1,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_RsaFingerprintContents(Tlv) ->
   dec_RsaFingerprintContents(Tlv, [16]).

dec_RsaFingerprintContents(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute modulus(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

case Tlv2 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv2}}}) % extra fields not allowed
end,
Res1 = {'RsaFingerprintContents',Term1},
Res1.


%%================================
%%  Ed25519FingerprintContents
%%================================
enc_Ed25519FingerprintContents(Val) ->
    enc_Ed25519FingerprintContents(Val, [<<48>>]).

enc_Ed25519FingerprintContents(Val, TagIn) ->
{_,Cindex1} = Val,

%%-------------------------------------------------
%% attribute publicKey(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

   BytesSoFar = [EncBytes1],
LenSoFar = EncLen1,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_Ed25519FingerprintContents(Tlv) ->
   dec_Ed25519FingerprintContents(Tlv, [16]).

dec_Ed25519FingerprintContents(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute publicKey(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = begin
Val1 = decode_octet_string(V1, [131072]),
C1 = byte_size(Val1),
if C1 =:= 32 ->
Val1;
true ->
exit({error,{asn1,bad_range}})
end
end,

case Tlv2 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv2}}}) % extra fields not allowed
end,
Res1 = {'Ed25519FingerprintContents',Term1},
Res1.

%%%
%%% Run-time functions.
%%%

'dialyzer-suppressions'(Arg) ->
    ok.

ber_decode_nif(B) ->
    asn1rt_nif:decode_ber_tlv(B).

collect_parts(TlvList) ->
    collect_parts(TlvList, []).

collect_parts([{_,L}|Rest], Acc) when is_list(L) ->
    collect_parts(Rest, [collect_parts(L)|Acc]);
collect_parts([{3,<<Unused,Bits/binary>>}|Rest], _Acc) ->
    collect_parts_bit(Rest, [Bits], Unused);
collect_parts([{_T,V}|Rest], Acc) ->
    collect_parts(Rest, [V|Acc]);
collect_parts([], Acc) ->
    list_to_binary(lists:reverse(Acc)).

collect_parts_bit([{3,<<Unused,Bits/binary>>}|Rest], Acc, Uacc) ->
    collect_parts_bit(Rest, [Bits|Acc], Unused + Uacc);
collect_parts_bit([], Acc, Uacc) ->
    list_to_binary([Uacc|lists:reverse(Acc)]).

decode_integer(Tlv, TagIn) ->
    Bin = match_tags(Tlv, TagIn),
    Len = byte_size(Bin),
    <<Int:Len/signed-unit:8>> = Bin,
    Int.

decode_octet_string(Tlv, TagsIn) ->
    Bin = match_and_collect(Tlv, TagsIn),
    binary:copy(Bin).

encode_integer(Val) ->
    Bytes =
        if
            Val >= 0 ->
                encode_integer_pos(Val, []);
            true ->
                encode_integer_neg(Val, [])
        end,
    {Bytes,length(Bytes)}.

encode_integer(Val, Tag) when is_integer(Val) ->
    encode_tags(Tag, encode_integer(Val));
encode_integer(Val, _Tag) ->
    exit({error,{asn1,{encode_integer,Val}}}).

encode_integer_neg(- 1, [B1|_T] = L) when B1 > 127 ->
    L;
encode_integer_neg(N, Acc) ->
    encode_integer_neg(N bsr 8, [N band 255|Acc]).

encode_integer_pos(0, [B|_Acc] = L) when B < 128 ->
    L;
encode_integer_pos(N, Acc) ->
    encode_integer_pos(N bsr 8, [N band 255|Acc]).

encode_length(L) when L =< 127 ->
    {[L],1};
encode_length(L) ->
    Oct = minimum_octets(L),
    Len = length(Oct),
    if
        Len =< 126 ->
            {[128 bor Len|Oct],Len + 1};
        true ->
            exit({error,{asn1,too_long_length_oct,Len}})
    end.

encode_restricted_string(OctetList, TagIn) when is_binary(OctetList) ->
    encode_tags(TagIn, OctetList, byte_size(OctetList));
encode_restricted_string(OctetList, TagIn) when is_list(OctetList) ->
    encode_tags(TagIn, OctetList, length(OctetList)).

encode_tags(TagIn, {BytesSoFar,LenSoFar}) ->
    encode_tags(TagIn, BytesSoFar, LenSoFar).

encode_tags([Tag|Trest], BytesSoFar, LenSoFar) ->
    {Bytes2,L2} = encode_length(LenSoFar),
    encode_tags(Trest,
                [Tag,Bytes2|BytesSoFar],
                LenSoFar + byte_size(Tag) + L2);
encode_tags([], BytesSoFar, LenSoFar) ->
    {BytesSoFar,LenSoFar}.

match_and_collect(Tlv, TagsIn) ->
    Val = match_tags(Tlv, TagsIn),
    case Val of
        [_|_] = PartList ->
            collect_parts(PartList);
        Bin when is_binary(Bin) ->
            Bin
    end.

match_tags({T,V}, [T]) ->
    V;
match_tags({T,V}, [T|Tt]) ->
    match_tags(V, Tt);
match_tags([{T,V}], [T|Tt]) ->
    match_tags(V, Tt);
match_tags([{T,_V}|_] = Vlist, [T]) ->
    Vlist;
match_tags(Tlv, []) ->
    Tlv;
match_tags({Tag,_V} = Tlv, [T|_Tt]) ->
    exit({error,{asn1,{wrong_tag,{{expected,T},{got,Tag,Tlv}}}}}).

minimum_octets(0, Acc) ->
    Acc;
minimum_octets(Val, Acc) ->
    minimum_octets(Val bsr 8, [Val band 255|Acc]).

minimum_octets(Val) ->
    minimum_octets(Val, []).
