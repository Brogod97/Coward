package kr.co.coward.contest.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import kr.co.coward.contest.model.vo.Contest;

public interface ContestService {

	/**
	 * 공모전 10개 리스트 조회 서비스 default, new, popular
	 * 
	 * @param type
	 * @return contestList
	 */
	List<Contest> getContestList(String type);

	/**
	 * 필터 공모전 리스트 조회 서비스
	 * 
	 * @param parameter
	 * @return
	 */
	List<Contest> filterContestList(String parameter);

	/**
	 * 공모전 개최 서비스
	 * 
	 * @param paramMap
	 * @return
	 * @throws IOException
	 */
	int contestCreate(Map<String, Object> paramMap) throws IOException;

	/**
	 * 공모전 상세조회 서비스
	 * 
	 * @param contestNo
	 * @return
	 */
	Contest contestDetail(int contestNo);

	/**
	 * 
	 * 맞춤 공모전 서비스
	 * 
	 * @param contestNo
	 * @return
	 */
	// public abstract Contest getRecommendContest(int typeNo);
	public abstract List<Contest> getRecommendList(int typeNo);

	/**
	 * 북마크 서비스
	 * 
	 * @param contest
	 * @return
	 */
	int bookmarkCount(Contest contest);

	/**
	 * 공모전 참가 서비스
	 * 
	 * @param paramMap
	 * @return
	 * @throws IOException
	 */
	int contestAttendForm(Map<String, Object> paramMap) throws IOException;

}
